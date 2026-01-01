// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Fund {
    address public owner = msg.sender;
    uint256 public totalShares;
    mapping(address => uint256) public shares;
    function join() external payable { shares[msg.sender] += msg.value; totalShares += msg.value; }
    function leave() external { uint256 s = shares[msg.sender]; shares[msg.sender] = 0; totalShares -= s; payable(msg.sender).transfer(s); }
    function close() external {
        require(msg.sender == owner);
        require(totalShares == 0, "not empty");
        selfdestruct(payable(owner));
    }
}
