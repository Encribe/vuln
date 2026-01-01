// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_BoolGap_V1 {
    bool[32] a;
    bool[32] b;
    bool[32] __gap;
    bool z;
}

contract StorageUpgrade_BoolGap_V2_Ok {
    bool[32] a;
    bool[32] b;
    bool[16] c; // does not use a full slot, but items before and after array are aligned to slots
    bool z;
}
