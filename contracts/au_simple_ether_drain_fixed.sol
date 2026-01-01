// SPDX-License-Identifier: MIT
// Fixed counterpart of SWC-105 simple_ether_drain, authored for the solbend class benchmark.
pragma solidity ^0.4.22;
contract SimpleEtherDrainFixed {
  address owner;
  constructor() public { owner = msg.sender; }
  function withdrawAllAnyone() public {
    require(msg.sender == owner);
    msg.sender.transfer(this.balance);
  }
  function () public payable {}
}
