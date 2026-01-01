// SPDX-License-Identifier: MIT
// Derived fix of Ethernaut CoinFlip.sol (file header MIT, repository AGPL-3.0):
// the coin side comes from a randomness coordinator callback (VRF style)
// fulfilled after the guess is locked, not from the block hash.
pragma solidity ^0.8.0;

interface IRandomCoordinator {
    function requestRandomness() external returns (uint256 requestId);
}

contract CoinFlipVRF {
    uint256 public consecutiveWins;
    IRandomCoordinator public immutable coordinator;
    mapping(uint256 => address) public requester;
    mapping(uint256 => bool) public guessOf;

    constructor(IRandomCoordinator _coordinator) {
        coordinator = _coordinator;
    }

    function flip(bool _guess) public returns (uint256 requestId) {
        requestId = coordinator.requestRandomness();
        requester[requestId] = msg.sender;
        guessOf[requestId] = _guess;
    }

    function fulfillRandomness(uint256 requestId, uint256 randomness) external {
        require(msg.sender == address(coordinator), "only coordinator");
        require(requester[requestId] != address(0), "unknown request");
        bool side = randomness % 2 == 1;
        if (side == guessOf[requestId]) {
            consecutiveWins++;
        } else {
            consecutiveWins = 0;
        }
        delete requester[requestId];
    }
}
