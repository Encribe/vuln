// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), crowdsale refund that keeps the contribution
// License: MIT (solbend authors)
contract Crowdsale {
    mapping(address => uint256) public contributed;
    uint256 public immutable deadline;
    uint256 public immutable goal;
    uint256 public raised;
    constructor(uint256 d, uint256 g) { deadline = d; goal = g; }
    function contribute() external payable { require(block.timestamp < deadline); contributed[msg.sender] += msg.value; raised += msg.value; }
    function refund() external {
        require(block.timestamp >= deadline && raised < goal);
        uint256 a = contributed[msg.sender];
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
