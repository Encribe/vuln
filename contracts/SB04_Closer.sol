// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Fund {
    address public owner = msg.sender;
    mapping(address => uint256) public shares;
    function join() external payable { shares[msg.sender] += msg.value; }
    function leave() external { uint256 s = shares[msg.sender]; shares[msg.sender] = 0; payable(msg.sender).transfer(s); }
    function close() external {
        require(msg.sender == owner);
        require(address(this).balance == 0, "not empty"); // 1 wei forced in blocks closing
        selfdestruct(payable(owner));
    }
}
