// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: implementation with a working once-only guard that is never locked, so anyone initializes it and kills it.
pragma solidity ^0.8.15;
contract ConstructorInitBuggy {
    address payable owner;
    bool private initialized;
    function initialize() external { require(!initialized, "done"); initialized = true; owner = payable(msg.sender); }
    function kill() external { require(msg.sender == owner); selfdestruct(owner); }
}
