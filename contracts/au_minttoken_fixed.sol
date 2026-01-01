// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: ERC20-style mint with its owner check.
pragma solidity ^0.8.20;
contract MintTokenFixed {
    address public owner;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    constructor() { owner = msg.sender; }
    function mint(address to, uint256 amount) external onlyOwner {
        totalSupply += amount;
        balanceOf[to] += amount;
    }
    function transfer(address to, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
