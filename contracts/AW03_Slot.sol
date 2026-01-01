// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Config {
    address public owner = msg.sender;
    uint256[8] public params;
    function write(uint256 slot, uint256 value) external {
        assembly { sstore(slot, value) } // caller picks any slot, including owner
    }
    function withdraw() external { require(msg.sender == owner); payable(owner).transfer(address(this).balance); }
    receive() external payable {}
}
