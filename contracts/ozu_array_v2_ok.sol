// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Array_V1 {
    uint[20] x1;
    uint[20] x2;
    uint[20] x3;
    uint[] x4;
    mapping (uint => uint[20]) m;
}

contract StorageUpgrade_Array_V2_Ok {
    uint[20] x1;
    uint[20] x2;
    uint[20] x3;
    uint[] x4;
    mapping (uint => uint[25]) m;
}
