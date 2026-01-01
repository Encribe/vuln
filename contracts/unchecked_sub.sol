// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), balance check missing inside unchecked
// License: MIT (solbend authors)
contract Wallet {
    mapping(address => uint256) public balanceOf;
    function deposit() external payable { balanceOf[msg.sender] += msg.value; }
    function move(address to, uint256 a) external {
        unchecked { balanceOf[msg.sender] -= a; balanceOf[to] += a; }
    }
    function withdraw(uint256 a) external {
        require(balanceOf[msg.sender] >= a);
        balanceOf[msg.sender] -= a;
        (bool ok, ) = msg.sender.call{value: a}("");
        require(ok);
    }
}
