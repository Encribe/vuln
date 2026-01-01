// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: initialize() runs once.
pragma solidity ^0.8.20;
contract VaultReinitSafe {
    address public owner;
    bool private initialized;
    function initialize(address _owner) external { require(!initialized, "already initialized"); initialized = true; owner = _owner; }
    receive() external payable {}
    function withdraw(uint256 amount) external { require(msg.sender == owner, "not owner"); payable(owner).transfer(amount); }
}
