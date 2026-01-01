// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract TokenSale {
    mapping(address => uint256) public tokens;
    uint256 public sold;
    function buy() external payable {
        tokens[msg.sender] += msg.value;
        sold += msg.value;
        assert(address(this).balance == sold); // invariant broken by forced ETH, assert reverts every buy
    }
}
