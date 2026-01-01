// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: the guarded initialize calls a helper that is itself public, so the helper re-initializes.
pragma solidity ^0.8.20;
contract PublicInitInternalBuggy {
    address public owner;
    bool private initialized;
    function initialize() external { require(!initialized, "done"); initialized = true; __Owner_init(msg.sender); }
    function __Owner_init(address o) public { owner = o; }
    receive() external payable {}
    function withdraw() external { require(msg.sender == owner, "not owner"); payable(owner).transfer(address(this).balance); }
}
