// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Config {
    address public owner = msg.sender;
    uint256[8] public params;
    function write(uint256 index, uint256 value) external {
        require(index < 8, "range");
        params[index] = value;
    }
    function withdraw() external { require(msg.sender == owner); payable(owner).transfer(address(this).balance); }
    receive() external payable {}
}
