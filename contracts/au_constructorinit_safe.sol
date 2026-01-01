// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: Buggy.sol pattern from Slither's unprotected-upgrade tests with the implementation locked in its constructor.
pragma solidity ^0.8.15;
contract ConstructorInitSafe {
    address payable owner;
    bool private initialized;
    constructor() { initialized = true; }
    function initialize() external { require(!initialized, "done"); initialized = true; owner = payable(msg.sender); }
    function kill() external { require(msg.sender == owner); selfdestruct(owner); }
}
