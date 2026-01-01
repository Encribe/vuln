// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: the init helper is internal.
pragma solidity ^0.8.20;
contract PublicInitInternalSafe {
    address public owner;
    bool private initialized;
    function initialize() external { require(!initialized, "done"); initialized = true; __Owner_init(msg.sender); }
    function __Owner_init(address o) internal { owner = o; }
    receive() external payable {}
    function withdraw() external { require(msg.sender == owner, "not owner"); payable(owner).transfer(address(this).balance); }
}
