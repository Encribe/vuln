// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), unsafe downcast in the ledger update (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract Pot {
    mapping(address => uint96) public balanceOf;
    function deposit() external payable { require(msg.value <= type(uint96).max); balanceOf[msg.sender] += uint96(msg.value); }
    function withdraw(uint256 a) external {
        require(a <= type(uint96).max, "cast");
        balanceOf[msg.sender] -= uint96(a);
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
