// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Enum_V1 {
    enum Enum1 {
        A,
        B
    }
    Enum1 data1;
    Enum1 data2;
    Enum1 data3;
    Enum1 data4;
}

contract StorageUpgrade_Enum_V2_Ok {
    enum Enum2 {
        A,
        B
    }
    enum Enum2Larger {
        A,
        B,
        C
    }
    Enum2Larger data1;
    Enum2 data2;
    Enum2 data3;
    Enum2 data4;
}
