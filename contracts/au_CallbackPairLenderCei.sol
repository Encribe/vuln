// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Fixed form of au_CallbackPairLender: burn updates the reserves before it runs the caller callback.
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

interface IBurnCallback {
    function onBurn(uint256 amount0, uint256 amount1) external;
}

contract CallbackPairCei {
    IERC20 public immutable token0;
    IERC20 public immutable token1;
    uint256 public reserve0;
    uint256 public reserve1;
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
    constructor(IERC20 _t0, IERC20 _t1) {
        token0 = _t0;
        token1 = _t1;
    }

    function mint(uint256 a0, uint256 a1) external lock returns (uint256 liq) {
        liq = totalSupply == 0 ? a0 + a1 : (a0 + a1) * totalSupply / (reserve0 + reserve1);
        require(token0.transferFrom(msg.sender, address(this), a0));
        require(token1.transferFrom(msg.sender, address(this), a1));
        reserve0 += a0;
        reserve1 += a1;
        totalSupply += liq;
        balanceOf[msg.sender] += liq;
    }

    function burn(uint256 liq) external lock {
        uint256 a0 = reserve0 * liq / totalSupply;
        uint256 a1 = reserve1 * liq / totalSupply;
        balanceOf[msg.sender] -= liq;
        totalSupply -= liq;
        require(token0.transfer(msg.sender, a0));
        require(token1.transfer(msg.sender, a1));
        reserve0 -= a0;
        reserve1 -= a1;
        if (msg.sender.code.length > 0) IBurnCallback(msg.sender).onBurn(a0, a1);
    }

    function getReserves() external view returns (uint256, uint256) {
        return (reserve0, reserve1);
    }

    function lpPrice() external view returns (uint256) {
        return (reserve0 + reserve1) * 1e18 / totalSupply;
    }
}
contract PairLenderCei {
    CallbackPairCei public immutable pool;
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

    constructor(CallbackPairCei _pool, IERC20 _debtToken) {
        pool = _pool;
        debtToken = _debtToken;
    }

    function value(address who) public view returns (uint256) {
        return collateral[who] * pool.lpPrice() / 1e18;
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
