// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Re-creation of the Curve get_virtual_price read-only reentrancy (dForce Feb 2023, Market.xyz Oct 2022, Midas Jan 2023): remove_liquidity pays ETH before burning LP, and the lender prices LP collateral with get_virtual_price during that call.
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract CurveEthPool {
    IERC20 public immutable token;
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

    constructor(IERC20 _token) { token = _token; }

    function add_liquidity(uint256 tokenAmount) external payable lock returns (uint256 minted) {
        uint256 before = address(this).balance - msg.value + token.balanceOf(address(this));
        minted = totalSupply == 0 ? msg.value + tokenAmount : (msg.value + tokenAmount) * totalSupply / before;
        require(token.transferFrom(msg.sender, address(this), tokenAmount));
        totalSupply += minted;
        balanceOf[msg.sender] += minted;
    }

    function remove_liquidity(uint256 lp) external lock {
        uint256 ethOut = address(this).balance * lp / totalSupply;
        uint256 tokenOut = token.balanceOf(address(this)) * lp / totalSupply;
        (bool ok,) = payable(msg.sender).call{value: ethOut}("");
        require(ok);
        balanceOf[msg.sender] -= lp;
        totalSupply -= lp;
        require(token.transfer(msg.sender, tokenOut));
    }

    function get_virtual_price() external view returns (uint256) {

        return (address(this).balance + token.balanceOf(address(this))) * 1e18 / totalSupply;
    }
}

contract LpLender {
    CurveEthPool public immutable pool;
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

    constructor(CurveEthPool _pool, IERC20 _debtToken) {
        pool = _pool;
        debtToken = _debtToken;
    }

    function value(address who) public view returns (uint256) {
        return collateral[who] * pool.get_virtual_price() / 1e18;
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
