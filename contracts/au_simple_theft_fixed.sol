// SPDX-License-Identifier: MIT
// Fixed counterpart of Mythril tests simple_theft.sol, authored for the solbend class benchmark.
pragma solidity ^0.8.0;
contract FallbackFixed {
  address owner;
  constructor() { owner = msg.sender; }
  function withdraw() public { require(msg.sender == owner); payable(msg.sender).transfer(address(this).balance); }
}
