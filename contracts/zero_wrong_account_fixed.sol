// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), balance cleared on the receiver instead of the caller (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract Deposits {
    mapping(address => uint256) public balanceOf;
    function deposit() external payable { balanceOf[msg.sender] += msg.value; }
    function withdrawTo(address to) external {
        uint256 a = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        (bool ok, ) = to.call{value: a}("");
        require(ok);
    }
}
