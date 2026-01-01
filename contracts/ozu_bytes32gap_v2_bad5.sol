// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Bytes32Gap_V1 {
    uint256 a;
    uint256 b;
    bytes32[48] __gap;
    uint256 z;
}

contract StorageUpgrade_Bytes32Gap_V2_Bad5 {
    uint256 a;
    uint256 b;
    uint256 c;
    uint256 d;
    bytes32[47] __gap;
    uint256 z;
}
