// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// owner powers regression (PowEth): docs/rugpull.md "Owner powers"
contract PowEth {
    mapping(address => uint256) public deposits;
    address public owner = msg.sender;

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    function withdraw(uint256 a) external {
        deposits[msg.sender] -= a;
        payable(msg.sender).transfer(a);
    }

    function sweep() external {
        require(msg.sender == owner, "owner");
        payable(owner).transfer(address(this).balance);
    }
}
