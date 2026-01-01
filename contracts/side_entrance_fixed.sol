// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/side-entrance/SideEntranceLenderPool.sol (fixed version written for this benchmark)
// License: MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header
interface IFlashLoanEtherReceiver { function execute() external payable; }
contract SideEntranceLenderPool {
    mapping(address => uint256) public balances;
    bool private lending;
    function deposit() external payable { require(!lending, "in loan"); balances[msg.sender] += msg.value; }
    function withdraw() external {
        require(!lending, "in loan");
        uint256 amount = balances[msg.sender];
        delete balances[msg.sender];
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok);
    }
    function flashLoan(uint256 amount) external {
        require(!lending);
        lending = true;
        uint256 balanceBefore = address(this).balance;
        IFlashLoanEtherReceiver(msg.sender).execute{value: amount}();
        require(address(this).balance >= balanceBefore, "RepayFailed");
        lending = false;
    }
}
