// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: reinitializer runs once per version.
pragma solidity ^0.8.20;
contract VersionedReinitSafe {
    uint8 private version;
    address public treasury;
    function initializeV2(address _treasury) external { require(version < 2, "old"); version = 2; treasury = _treasury; }
    receive() external payable {}
    function flush() external { payable(treasury).transfer(address(this).balance); }
}
