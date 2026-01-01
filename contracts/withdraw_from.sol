// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), withdrawal on behalf of an owner without allowance
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Pool {
    IERC20 public immutable token;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    constructor(IERC20 t) { token = t; }
    function deposit(uint256 a) external { require(token.transferFrom(msg.sender, address(this), a)); balanceOf[msg.sender] += a; }
    function approve(address s, uint256 a) external { allowance[msg.sender][s] = a; }
    function withdrawFrom(address owner, address to, uint256 a) external {
        balanceOf[owner] -= a;
        require(token.transfer(to, a));
    }
}
