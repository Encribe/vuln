// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: kill guard passes for anyone while no operator is set.
pragma solidity ^0.7.6;
contract OperatorKillBuggy {
    address payable public owner;
    address public operator;
    constructor() { owner = msg.sender; }
    function setOperator(address o) external { require(msg.sender == owner); operator = o; }
    function kill(address payable to) external { require(msg.sender == owner || msg.sender == operator || operator == address(0)); selfdestruct(to); }
    receive() external payable {}
}
