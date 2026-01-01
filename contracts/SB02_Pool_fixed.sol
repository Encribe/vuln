// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Pool {
    mapping(address => uint256) public bal;
    uint256 public total;
    function deposit() external payable { bal[msg.sender] += msg.value; total += msg.value; }
    function withdraw(uint256 a) external {
        require(address(this).balance >= total, "accounting");
        bal[msg.sender] -= a; total -= a;
        payable(msg.sender).transfer(a);
    }
}
