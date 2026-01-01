// SPDX-License-Identifier: MIT
// Derived fix of Ethernaut King.sol (file header MIT, repository AGPL-3.0):
// the previous king's prize is credited and withdrawn by the king, never pushed.
pragma solidity ^0.8.0;

contract KingPull {
    address king;
    uint256 public prize;
    address public owner;
    mapping(address => uint256) public pending;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        pending[king] += msg.value;
        king = msg.sender;
        prize = msg.value;
    }

    function withdraw() external {
        uint256 amount = pending[msg.sender];
        pending[msg.sender] = 0;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok);
    }

    function _king() public view returns (address) {
        return king;
    }
}
