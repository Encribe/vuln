// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_ObviousMismatch_V1 {
    struct S {
        uint m;
    }

    uint x1;
    S s1;
    uint[] a1;
}

contract StorageUpgrade_ObviousMismatch_V2_Bad {
    string x1;
    uint s1;
    mapping (uint => uint) a1;
}
