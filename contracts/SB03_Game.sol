// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract EtherGame {
    uint256 public constant TARGET = 7 ether;
    address public winner;
    function deposit() external payable {
        require(msg.value == 1 ether);
        uint256 b = address(this).balance;
        require(b <= TARGET, "game over");
        if (b == TARGET) winner = msg.sender; // forced ETH skips the target
    }
    function claim() external { require(msg.sender == winner); payable(msg.sender).transfer(address(this).balance); }
}
