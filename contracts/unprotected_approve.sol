// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), unprotected approval of contract funds
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Treasury {
    IERC20 public immutable token;
    address public owner;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function approveSpender(address spender, uint256 amount) external {
        token.approve(spender, amount);
    }
    function pay(address to, uint256 amount) external {
        require(msg.sender == owner);
        require(token.transfer(to, amount));
    }
}
