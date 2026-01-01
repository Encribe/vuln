// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), msg.value counted once per recipient in a batch (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract Gifts {
    mapping(address => uint256) public balanceOf;
    function depositFor(address[] calldata tos, uint256[] calldata amounts) external payable {
        require(tos.length == amounts.length);
        uint256 sum;
        for (uint256 i = 0; i < tos.length; i++) { balanceOf[tos[i]] += amounts[i]; sum += amounts[i]; }
        require(sum == msg.value, "value");
    }
    function withdraw() external {
        uint256 a = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
