// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), ERC20 transferFrom that checks but never spends the allowance
// License: MIT (solbend authors)
contract Token {
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    constructor() { balanceOf[msg.sender] = 1e24; }
    function transfer(address to, uint256 a) external returns (bool) { balanceOf[msg.sender] -= a; balanceOf[to] += a; return true; }
    function approve(address s, uint256 a) external returns (bool) { allowance[msg.sender][s] = a; return true; }
    function transferFrom(address from, address to, uint256 a) external returns (bool) {
        require(allowance[from][msg.sender] >= a, "allowance");
        balanceOf[from] -= a;
        balanceOf[to] += a;
        return true;
    }
}
