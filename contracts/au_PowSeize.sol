// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// owner powers regression (PowSeize): docs/rugpull.md "Owner powers"
contract PowSeize {
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;
    address public owner;

    constructor() {
        owner = msg.sender;
        totalSupply = 1e24;
        balanceOf[msg.sender] = 1e24;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "owner");
        _;
    }

    function transfer(address to, uint256 a) external returns (bool) {

        balanceOf[msg.sender] -= a;
        balanceOf[to] += a;
        return true;
    }

    function burnFrom(address from, uint256 a) external onlyOwner {
        balanceOf[from] -= a;
        totalSupply -= a;
    }
}
