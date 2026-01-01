// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), fee-on-transfer token credited at the nominal amount (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Vault {
    IERC20 public immutable token;
    mapping(address => uint256) public balanceOf;
    constructor(IERC20 t) { token = t; }
    function deposit(uint256 amount) external {
        uint256 before = token.balanceOf(address(this));
        require(token.transferFrom(msg.sender, address(this), amount));
        balanceOf[msg.sender] += token.balanceOf(address(this)) - before;
    }
    function withdraw(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount));
    }
}
