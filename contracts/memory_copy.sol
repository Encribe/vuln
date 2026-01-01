// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), storage vs memory data location
// License: MIT (solbend authors)
contract Bank {
    struct Account { uint256 balance; uint256 lastUpdate; }
    mapping(address => Account) public accounts;
    function deposit() external payable { accounts[msg.sender].balance += msg.value; accounts[msg.sender].lastUpdate = block.number; }
    function withdraw(uint256 a) external {
        Account memory acc = accounts[msg.sender];
        require(acc.balance >= a);
        acc.balance -= a;
        acc.lastUpdate = block.number;
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
