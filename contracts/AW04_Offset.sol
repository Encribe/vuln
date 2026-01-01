// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Store {
    address public owner = msg.sender;
    mapping(address => uint256) public credit;
    function put(uint256 offset, uint256 value) external {
        uint256 base;
        assembly { base := credit.slot }
        assembly { sstore(add(base, offset), value) } // offset reaches slot 0
    }
    function withdraw() external { require(msg.sender == owner); payable(owner).transfer(address(this).balance); }
    receive() external payable {}
}
