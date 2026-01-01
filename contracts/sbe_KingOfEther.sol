// SPDX-License-Identifier: MIT
// Adapted from solidity-by-example.org hacks/denial-of-service/DenialOfService.sol (MIT):
// the Attack contract was removed, KingOfEther is unchanged.
pragma solidity ^0.8.26;

contract KingOfEther {
    address public king;
    uint256 public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent,) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}
