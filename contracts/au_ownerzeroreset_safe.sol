// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: setup is guarded by a separate once-only flag, so renouncing does not reopen it.
pragma solidity ^0.8.20;
contract OwnerZeroResetSafe {
    address public owner;
    bool private done;
    function setup() external { require(!done, "set"); done = true; owner = msg.sender; }
    function renounce() external { require(msg.sender == owner, "not owner"); owner = address(0); }
    receive() external payable {}
    function withdraw() external { require(msg.sender == owner, "not owner"); payable(owner).transfer(address(this).balance); }
}
