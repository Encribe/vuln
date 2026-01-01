// SPDX-License-Identifier: MIT
// derived-fix of solidity-by-example hacks/block-timestamp-manipulation/BlockTimestamp.sol
// (MIT, 5bcdca0): the pot goes to the fifteenth spinner, so no block value
// decides who is paid.
pragma solidity ^0.8.26;

contract Roulette {
    uint256 public spins;

    constructor() payable {}

    function spin() external payable {
        require(msg.value == 10 ether); // must send 10 ether to play
        spins += 1;
        if (spins % 15 == 0) {
            (bool sent,) = msg.sender.call{value: address(this).balance}("");
            require(sent, "Failed to send Ether");
        }
    }
}
