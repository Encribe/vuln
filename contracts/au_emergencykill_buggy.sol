// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: emergency shutdown callable by anyone.
pragma solidity ^0.7.6;
contract EmergencyKillBuggy {
    address payable public owner;
    mapping(address => uint256) public deposits;
    constructor() { owner = msg.sender; }
    function deposit() external payable { deposits[msg.sender] += msg.value; }
    function emergencyShutdown() external { selfdestruct(owner); }
}
