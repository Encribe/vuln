// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_EndGap_V1a {
    uint256 a;
    uint256[1] private __gap;
}

contract StorageUpgrade_EndGap_V2a {
    uint256 a;
    uint256[1] small;
}
