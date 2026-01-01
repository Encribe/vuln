// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), unchecked ERC20 return value on deposit
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Escrow {
    IERC20 public immutable token;
    mapping(address => uint256) public credit;
    constructor(IERC20 t) { token = t; }
    function deposit(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        credit[msg.sender] += amount;
    }
    function withdraw(uint256 amount) external {
        credit[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount));
    }
}
