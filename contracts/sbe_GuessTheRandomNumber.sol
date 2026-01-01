// SPDX-License-Identifier: MIT
// Adapted from solidity-by-example.org hacks/randomness/Randomness.sol (MIT):
// the Attack contract was removed, GuessTheRandomNumber is unchanged.
pragma solidity ^0.8.26;

contract GuessTheRandomNumber {
    constructor() payable {}

    function guess(uint256 _guess) public {
        uint256 answer = uint256(
            keccak256(
                abi.encodePacked(blockhash(block.number - 1), block.timestamp)
            )
        );

        if (_guess == answer) {
            (bool sent,) = msg.sender.call{value: 1 ether}("");
            require(sent, "Failed to send Ether");
        }
    }
}
