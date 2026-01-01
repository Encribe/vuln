// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Uint128Gap_V1 {
    uint128 a;
    uint128[49] __gap;
    uint128 z;
}

contract StorageUpgrade_Uint128Gap_V2_Ok {
    uint128 a; // half slot
    uint128 b; // half slot
    uint128[49] __gap;
    uint128 z;
}
