// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Partial fix of au_BalancerRateLender, the shape of integrations that added the vault-context check to one entry point only: borrow calls ensureNotLocked, liquidate does not, so a reentrant liquidation still reads the inflated or deflated rate.
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract RateVaultHalf {
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
    uint256 public pooledEth;

    function join() external payable lock returns (uint256 shares) {
        shares = totalSupply == 0 ? msg.value : msg.value * totalSupply / pooledEth;
        pooledEth += msg.value;
        totalSupply += shares;
        balanceOf[msg.sender] += shares;
    }

    function exit(uint256 shares) external lock {
        uint256 amount = shares * pooledEth / totalSupply;
        balanceOf[msg.sender] -= shares;
        totalSupply -= shares;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok);
        pooledEth -= amount;
    }

    function getRate() external view returns (uint256) {

        return pooledEth * 1e18 / totalSupply;
    }

    function ensureNotLocked() external view {
        require(!locked, "locked");
    }
}
contract RateLenderHalf {
    RateVaultHalf public immutable pool;
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

    constructor(RateVaultHalf _pool, IERC20 _debtToken) {
        pool = _pool;
        debtToken = _debtToken;
    }

    function value(address who) public view returns (uint256) {
        return collateral[who] * pool.getRate() / 1e18;
    }

    function depositCollateral(uint256 amount) external nonReentrant {
        require(pool.transferFrom(msg.sender, address(this), amount));
        collateral[msg.sender] += amount;
    }

    function borrow(uint256 amount) external nonReentrant {
        pool.ensureNotLocked();
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
