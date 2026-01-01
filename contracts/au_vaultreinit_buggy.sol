// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: initialize() has no once-only guard, anyone can re-initialize and take ownership.
pragma solidity ^0.8.20;
contract VaultReinitBuggy {
    address public owner;
    function initialize(address _owner) external { owner = _owner; }
    receive() external payable {}
    function withdraw(uint256 amount) external { require(msg.sender == owner, "not owner"); payable(owner).transfer(amount); }
}
