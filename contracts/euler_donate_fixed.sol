// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Minimized from Euler Finance (March 2023, $197M, rekt "euler-rekt"):
// EToken.donateToReserves lowered the caller's collateral and never checked
// the account's health afterwards, so a leveraged account could make itself
// insolvent and liquidate itself at a discount. The mechanism: a function
// that lowers an account's collateral keeps debt <= collateral.

contract EulerDonateFixed {
    mapping(address => uint256) public collateral;
    mapping(address => uint256) public debt;
    uint256 public reserves;

    function deposit() external payable {
        collateral[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) external {
        require(debt[msg.sender] + amount <= collateral[msg.sender], "health");
        debt[msg.sender] += amount;
        payable(msg.sender).transfer(amount);
    }

    function donateToReserves(uint256 amount) external {
        collateral[msg.sender] -= amount;
        reserves += amount;
        require(debt[msg.sender] <= collateral[msg.sender], "health");
    }
}
