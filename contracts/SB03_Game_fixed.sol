// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract EtherGame {
    uint256 public constant TARGET = 7 ether;
    uint256 public deposited;
    address public winner;
    function deposit() external payable {
        require(msg.value == 1 ether);
        deposited += msg.value;
        require(deposited <= TARGET, "game over");
        if (deposited == TARGET) winner = msg.sender;
    }
    function claim() external { require(msg.sender == winner); payable(msg.sender).transfer(address(this).balance); }
}
