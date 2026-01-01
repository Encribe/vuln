// Derived fix of SWC-120 random_number_generator.sol (MIT): the seed is
// delivered by a randomness coordinator instead of being built from
// block.timestamp, block.number and blockhash.
pragma solidity ^0.4.25;

contract RandomNumberGeneratorVRF {
  address public coordinator;
  uint256 private seed;
  bool public ready;

  constructor(address _coordinator) public {
    coordinator = _coordinator;
  }

  function fulfillRandomness(uint256 randomness) public {
    require(msg.sender == coordinator);
    seed = randomness;
    ready = true;
  }

  function random(uint max) view internal returns (uint256 result) {
    require(ready);
    return uint256(keccak256(abi.encodePacked(seed))) % max + 1;
  }
}
