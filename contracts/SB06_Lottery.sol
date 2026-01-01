// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Lottery {
    address[] public players;
    function enter() external payable {
        require(msg.value == 1 ether);
        players.push(msg.sender);
        if (address(this).balance == 10 ether) { // never true after a forced send
            address w = players[uint256(blockhash(block.number - 1)) % players.length];
            delete players;
            payable(w).transfer(10 ether);
        }
    }
}
