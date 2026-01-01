// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A first-come answer: the first account to send the number whose hash the
// contract holds becomes the winner, a later one changes nothing. Both
// orders succeed and end in different states. The answer is a literal of
// the source, so the scripts' arguments (1, 2, 3 and the source's literals,
// soundness.md item 10124) meet the guard: the state law must be FOUND.
contract OrderGuess {
    bytes32 public immutable answerHash = keccak256(abi.encodePacked(uint256(4242)));
    address public winner;

    function solve(uint256 a) external {
        require(keccak256(abi.encodePacked(a)) == answerHash, "wrong");
        if (winner == address(0)) {
            winner = msg.sender;
        }
    }
}
