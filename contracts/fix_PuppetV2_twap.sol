// SPDX-License-Identifier: MIT
// Derived fix of Damn Vulnerable DeFi v4 PuppetV2Pool.sol (MIT): the quote is a
// Uniswap V2 time-weighted average over at least 30 minutes, taken from the
// pair's cumulative price, not its current reserves.
pragma solidity =0.8.25;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface IUniswapV2Pair {
    function token0() external view returns (address);
    function price0CumulativeLast() external view returns (uint256);
    function price1CumulativeLast() external view returns (uint256);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract PuppetV2PoolTwap {
    uint256 public constant PERIOD = 30 minutes;

    IUniswapV2Pair public immutable pair;
    IERC20 private immutable _token;
    IERC20 private immutable _weth;
    bool private immutable tokenIs0;

    uint256 public priceCumulativeLast;
    uint32 public blockTimestampLast;
    uint256 public priceAverage; // UQ112x112 WETH per token

    mapping(address => uint256) public deposits;

    constructor(address wethAddress, address tokenAddress, IUniswapV2Pair _pair) {
        _weth = IERC20(wethAddress);
        _token = IERC20(tokenAddress);
        pair = _pair;
        tokenIs0 = _pair.token0() == tokenAddress;
        priceCumulativeLast = tokenIs0 ? _pair.price0CumulativeLast() : _pair.price1CumulativeLast();
        (,, blockTimestampLast) = _pair.getReserves();
    }

    function update() public {
        (,, uint32 ts) = pair.getReserves();
        uint32 elapsed;
        unchecked { elapsed = ts - blockTimestampLast; }
        require(elapsed >= PERIOD, "period");
        uint256 cumulative = tokenIs0 ? pair.price0CumulativeLast() : pair.price1CumulativeLast();
        unchecked { priceAverage = (cumulative - priceCumulativeLast) / elapsed; }
        priceCumulativeLast = cumulative;
        blockTimestampLast = ts;
    }

    function borrow(uint256 borrowAmount) external {
        uint256 amount = calculateDepositOfWETHRequired(borrowAmount);
        _weth.transferFrom(msg.sender, address(this), amount);
        deposits[msg.sender] += amount;
        require(_token.transfer(msg.sender, borrowAmount), "Transfer failed");
    }

    function calculateDepositOfWETHRequired(uint256 tokenAmount) public view returns (uint256) {
        require(priceAverage != 0, "no average");
        return tokenAmount * priceAverage / (2 ** 112) * 3;
    }
}
