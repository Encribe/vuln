// SPDX-License-Identifier: MIT
// Adapted from Damn Vulnerable DeFi v4 src/puppet-v2/PuppetV2Pool.sol (MIT):
// UniswapV2Library.getReserves (pair lookup by CREATE2 hash) is replaced by
// reading a stored pair directly, quote() is inlined unchanged.
pragma solidity =0.8.25;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external returns (uint256);
}

interface IUniswapV2Pair {
    function token0() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract PuppetV2Pool {
    address private _uniswapPair;
    IERC20 private _token;
    IERC20 private _weth;

    mapping(address => uint256) public deposits;

    event Borrowed(address indexed borrower, uint256 depositRequired, uint256 borrowAmount, uint256 timestamp);

    constructor(address wethAddress, address tokenAddress, address uniswapPairAddress) {
        _weth = IERC20(wethAddress);
        _token = IERC20(tokenAddress);
        _uniswapPair = uniswapPairAddress;
    }

    function borrow(uint256 borrowAmount) external {
        uint256 amount = calculateDepositOfWETHRequired(borrowAmount);
        _weth.transferFrom(msg.sender, address(this), amount);
        deposits[msg.sender] += amount;
        require(_token.transfer(msg.sender, borrowAmount), "Transfer failed");
        emit Borrowed(msg.sender, amount, borrowAmount, block.timestamp);
    }

    function calculateDepositOfWETHRequired(uint256 tokenAmount) public view returns (uint256) {
        uint256 depositFactor = 3;
        return _getOracleQuote(tokenAmount) * depositFactor / 1 ether;
    }

    function _getOracleQuote(uint256 amount) private view returns (uint256) {
        (uint256 r0, uint256 r1,) = IUniswapV2Pair(_uniswapPair).getReserves();
        (uint256 reservesWETH, uint256 reservesToken) =
            IUniswapV2Pair(_uniswapPair).token0() == address(_weth) ? (r0, r1) : (r1, r0);
        return quote(amount * 10 ** 18, reservesToken, reservesWETH);
    }

    function quote(uint256 amountA, uint256 reserveA, uint256 reserveB) internal pure returns (uint256 amountB) {
        require(amountA > 0, "UniswapV2Library: INSUFFICIENT_AMOUNT");
        require(reserveA > 0 && reserveB > 0, "UniswapV2Library: INSUFFICIENT_LIQUIDITY");
        amountB = amountA * reserveB / reserveA;
    }
}
