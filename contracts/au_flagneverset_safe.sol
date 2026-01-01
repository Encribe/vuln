// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: the guard flag is checked and set.
pragma solidity ^0.8.20;
contract FlagNeverSetSafe {
    address public admin;
    bool public initialized;
    uint256 public fee;
    function init(address _admin, uint256 _fee) external { require(!initialized, "done"); initialized = true; admin = _admin; fee = _fee; }
    receive() external payable {}
    function collect() external { require(msg.sender == admin, "not admin"); payable(admin).transfer(address(this).balance); }
}
