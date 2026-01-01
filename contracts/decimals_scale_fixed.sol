// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), decimal scaling rounded up on the way out (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Wrapper {
    IERC20 public immutable usdc;
    mapping(address => uint256) public balanceOf;
    constructor(IERC20 u) { usdc = u; }
    function wrap(uint256 amount6) external { require(usdc.transferFrom(msg.sender, address(this), amount6)); balanceOf[msg.sender] += amount6 * 1e12; }
    function unwrap(uint256 amount18) external {
        balanceOf[msg.sender] -= amount18;
        require(usdc.transfer(msg.sender, amount18 / 1e12));
    }
    function transfer(address to, uint256 a) external { balanceOf[msg.sender] -= a; balanceOf[to] += a; }
}
