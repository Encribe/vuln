// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), cached balances in an internal transfer (self-transfer)
// License: MIT (solbend authors)
contract Ledger {
    mapping(address => uint256) public balanceOf;
    function deposit() external payable { balanceOf[msg.sender] += msg.value; }
    function withdraw(uint256 a) external {
        balanceOf[msg.sender] -= a;
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
    function transfer(address to, uint256 a) external {
        uint256 fromBal = balanceOf[msg.sender];
        uint256 toBal = balanceOf[to];
        require(fromBal >= a);
        balanceOf[msg.sender] = fromBal - a;
        balanceOf[to] = toBal + a;
    }
}
