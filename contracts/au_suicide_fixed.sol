// SPDX-License-Identifier: MIT
// Fixed counterpart of Mythril tests suicide.sol, authored for the solbend class benchmark.
pragma solidity ^0.5.0;
contract SuicideFixed {
  address owner;
  constructor() public { owner = msg.sender; }
  function kill(address payable addr) public { require(msg.sender == owner); selfdestruct(addr); }
}
