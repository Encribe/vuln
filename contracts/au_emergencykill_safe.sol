// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: emergency shutdown owner only.
pragma solidity ^0.7.6;
contract EmergencyKillSafe {
    address payable public owner;
    mapping(address => uint256) public deposits;
    constructor() { owner = msg.sender; }
    function deposit() external payable { deposits[msg.sender] += msg.value; }
    function emergencyShutdown() external { require(msg.sender == owner, "not owner"); selfdestruct(owner); }
}
