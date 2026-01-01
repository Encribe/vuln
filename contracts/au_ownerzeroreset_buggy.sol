// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: setup is guarded by owner == 0, but renounce sets owner back to 0, which reopens setup.
pragma solidity ^0.8.20;
contract OwnerZeroResetBuggy {
    address public owner;
    function setup() external { require(owner == address(0), "set"); owner = msg.sender; }
    function renounce() external { require(msg.sender == owner, "not owner"); owner = address(0); }
    receive() external payable {}
    function withdraw() external { require(msg.sender == owner, "not owner"); payable(owner).transfer(address(this).balance); }
}
