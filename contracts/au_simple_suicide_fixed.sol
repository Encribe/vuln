// SPDX-License-Identifier: MIT
// Fixed counterpart of SWC-106 simple_suicide, authored for the solbend class benchmark.
pragma solidity ^0.4.22;
contract SimpleSuicideFixed {
  address owner;
  constructor() public { owner = msg.sender; }
  function sudicideAnyone() public { require(msg.sender == owner); selfdestruct(msg.sender); }
}
