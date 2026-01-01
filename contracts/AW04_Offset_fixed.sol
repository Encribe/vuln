// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Store {
    address public owner = msg.sender;
    mapping(address => uint256) public credit;
    function put(uint256, uint256 value) external {
        credit[msg.sender] = value;
    }
    function withdraw() external { require(msg.sender == owner); payable(owner).transfer(address(this).balance); }
    receive() external payable {}
}
