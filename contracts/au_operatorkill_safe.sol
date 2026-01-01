// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: kill guard owner only.
pragma solidity ^0.7.6;
contract OperatorKillSafe {
    address payable public owner;
    address public operator;
    constructor() { owner = msg.sender; }
    function setOperator(address o) external { require(msg.sender == owner); operator = o; }
    function kill(address payable to) external { require(msg.sender == owner); selfdestruct(to); }
    receive() external payable {}
}
