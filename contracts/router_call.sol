// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pattern of the 2022 Transit Swap and 2023 Dexible approval drains
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract SwapRouter {
    function swap(IERC20 tokenIn, uint256 amountIn, address target, bytes calldata data) external {
        require(tokenIn.transferFrom(msg.sender, address(this), amountIn));
        tokenIn.approve(target, amountIn);
        (bool ok, ) = target.call(data);
        require(ok);
    }
}
