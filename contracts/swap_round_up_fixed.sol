// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), fixed rate swap rounding output up (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract RateSwap {
    IERC20 public immutable tokenIn;
    IERC20 public immutable tokenOut;
    uint256 public constant RATE = 3e17;
    constructor(IERC20 i, IERC20 o) { tokenIn = i; tokenOut = o; }
    function swap(uint256 amountIn) external {
        uint256 out = amountIn * RATE / 1e18;
        require(tokenIn.transferFrom(msg.sender, address(this), amountIn));
        require(tokenOut.transfer(msg.sender, out));
    }
}
