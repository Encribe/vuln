// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), unsafe downcast in the ledger update
// License: MIT (solbend authors)
contract Pot {
    mapping(address => uint96) public balanceOf;
    function deposit() external payable { balanceOf[msg.sender] += uint96(msg.value); require(msg.value <= type(uint96).max); }
    function withdraw(uint256 a) external {
        balanceOf[msg.sender] -= uint96(a);
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
