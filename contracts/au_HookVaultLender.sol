// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Read-only reentrancy through a token receive hook (the ERC777 shape behind several 2023 lending incidents): withdraw pays the hook token before burning shares, so pricePerShare is low inside the hook and the lender liquidates healthy positions.
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

interface ITokensRecipient {
    function tokensReceived(address from, uint256 amount) external;
}

// A token with an ERC777 style receive hook: the recipient is called after
// the balances move.
contract HookToken {
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    function mint(address to, uint256 amount) external {
        balanceOf[to] += amount;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        _move(msg.sender, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        allowance[from][msg.sender] -= amount;
        _move(from, to, amount);
        return true;
    }

    function _move(address from, address to, uint256 amount) internal {
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        if (to.code.length > 0) {
            try ITokensRecipient(to).tokensReceived(from, amount) {} catch {}
        }
    }
}

contract HookVault {
    HookToken public immutable asset;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    bool private locked;

    modifier lock() {
        require(!locked, "locked");
        locked = true;
        _;
        locked = false;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        allowance[from][msg.sender] -= amount;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }
    constructor(HookToken _asset) { asset = _asset; }

    function deposit(uint256 amount) external lock returns (uint256 shares) {
        uint256 held = asset.balanceOf(address(this));
        shares = totalSupply == 0 ? amount : amount * totalSupply / held;
        totalSupply += shares;
        balanceOf[msg.sender] += shares;
        require(asset.transferFrom(msg.sender, address(this), amount));
    }

    function withdraw(uint256 shares) external lock {
        uint256 amount = shares * asset.balanceOf(address(this)) / totalSupply;
        require(asset.transfer(msg.sender, amount));
        balanceOf[msg.sender] -= shares;
        totalSupply -= shares;
    }

    function pricePerShare() external view returns (uint256) {
        return asset.balanceOf(address(this)) * 1e18 / totalSupply;
    }
}
contract HookShareLender {
    HookVault public immutable pool;
    IERC20 public immutable debtToken;
    mapping(address => uint256) public collateral;
    mapping(address => uint256) public debt;
    bool private entered;

    modifier nonReentrant() {
        require(!entered);
        entered = true;
        _;
        entered = false;
    }

    constructor(HookVault _pool, IERC20 _debtToken) {
        pool = _pool;
        debtToken = _debtToken;
    }

    function value(address who) public view returns (uint256) {
        return collateral[who] * pool.pricePerShare() / 1e18;
    }

    function depositCollateral(uint256 amount) external nonReentrant {
        require(pool.transferFrom(msg.sender, address(this), amount));
        collateral[msg.sender] += amount;
    }

    function borrow(uint256 amount) external nonReentrant {
        require((debt[msg.sender] + amount) * 2 <= value(msg.sender), "undercollateralized");
        debt[msg.sender] += amount;
        require(debtToken.transfer(msg.sender, amount));
    }

    function liquidate(address who) external nonReentrant {
        require(value(who) < debt[who] * 2, "healthy");
        require(debtToken.transferFrom(msg.sender, address(this), debt[who]));
        uint256 seized = collateral[who];
        collateral[who] = 0;
        debt[who] = 0;
        require(pool.transfer(msg.sender, seized));
    }
}
