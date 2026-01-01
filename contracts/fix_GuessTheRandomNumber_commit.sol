// SPDX-License-Identifier: MIT
// Derived fix of solidity-by-example.org Randomness.sol (MIT): the answer is
// committed by the house as a hash before any guess and revealed afterwards,
// so nothing a player can read on chain predicts it.
pragma solidity ^0.8.26;

contract GuessCommitReveal {
    address public immutable house;
    bytes32 public commitment;
    mapping(address => uint256) public guessOf;
    mapping(address => bool) public hasGuessed;
    bool public revealed;
    uint256 public answer;

    constructor(bytes32 _commitment) payable {
        house = msg.sender;
        commitment = _commitment;
    }

    function guess(uint256 _guess) external {
        require(!revealed, "closed");
        require(!hasGuessed[msg.sender], "once");
        hasGuessed[msg.sender] = true;
        guessOf[msg.sender] = _guess;
    }

    function reveal(uint256 _answer, bytes32 salt) external {
        require(msg.sender == house, "house");
        require(!revealed, "done");
        require(keccak256(abi.encodePacked(_answer, salt)) == commitment, "bad reveal");
        revealed = true;
        answer = _answer;
    }

    function claim() external {
        require(revealed, "not yet");
        require(hasGuessed[msg.sender] && guessOf[msg.sender] == answer, "lost");
        hasGuessed[msg.sender] = false;
        (bool sent,) = msg.sender.call{value: 1 ether}("");
        require(sent, "Failed to send Ether");
    }
}
