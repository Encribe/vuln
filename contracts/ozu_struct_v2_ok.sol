// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Struct_V1 {
    struct StructInner {
        uint y;
    }
    struct Struct1 {
        uint x;
        string s1;
        string s2;
        StructInner inner;
    }
    Struct1 data1;
    Struct1 data2;
    mapping (uint => Struct1) m;
    Struct1[10] a1;
    Struct1[10] a2;
    Struct1 data3;
}

contract StorageUpgrade_Struct_V2_Ok {
    struct StructInner {
        uint y;
    }
    struct Struct2 {
        uint x;
        string s1;
        string s2;
        StructInner inner;
    }
    struct Struct2Plus {
        uint x;
        string s1;
        string s2;
        StructInner inner;
        uint z;
    }
    Struct2 data1;
    Struct2 data2;
    mapping (uint => Struct2Plus) m;
    Struct2[10] a1;
    Struct2[10] a2;
    Struct2 data3;
}
