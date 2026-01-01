// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: a migrate step that destroys the old contract owner only.
pragma solidity ^0.7.6;
contract UpgradeKillSafe {
    address payable public owner;
    address public successor;
    constructor() { owner = msg.sender; }
    function setSuccessor(address s) external { require(msg.sender == owner); successor = s; }
    function migrate() external { require(msg.sender == owner, "not owner"); require(successor != address(0)); selfdestruct(payable(successor)); }
    receive() external payable {}
}
