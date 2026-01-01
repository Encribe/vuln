// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: reinitializer compares versions with <= instead of <, so the same version runs again.
pragma solidity ^0.8.20;
contract VersionedReinitBuggy {
    uint8 private version;
    address public treasury;
    function initializeV2(address _treasury) external { require(version <= 2, "old"); version = 2; treasury = _treasury; }
    receive() external payable {}
    function flush() external { payable(treasury).transfer(address(this).balance); }
}
