// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), credited amount taken from a parameter instead of msg.value
// License: MIT (solbend authors)
contract EthVault {
    mapping(address => uint256) public balanceOf;
    function deposit(uint256 amount) external payable {
        require(msg.value > 0);
        balanceOf[msg.sender] += amount;
    }
    function withdraw(uint256 a) external {
        balanceOf[msg.sender] -= a;
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
