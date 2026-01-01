// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), msg.value reused across delegatecall multicall entries (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract Seller {
    mapping(address => uint256) public credits;
    uint256 public constant PRICE = 1 ether;
    function buy(uint256 n) public payable { require(msg.value == n * PRICE); credits[msg.sender] += n; }
    function sell() external {
        credits[msg.sender] -= 1;
        (bool ok, ) = msg.sender.call{value: PRICE}("");
        require(ok);
    }
}
