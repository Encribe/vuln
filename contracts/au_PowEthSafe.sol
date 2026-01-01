// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// owner powers regression (PowEthSafe): docs/rugpull.md "Owner powers"
contract PowEthSafe {
    mapping(address => uint256) public deposits;
    address public owner = msg.sender;

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    function withdraw(uint256 a) external {
        deposits[msg.sender] -= a;
        payable(msg.sender).transfer(a);
    }

}
