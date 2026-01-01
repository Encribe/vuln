// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Mapping_V1 {
    mapping (uint => uint[10]) m1;
    mapping (string => uint) m2;
}

contract StorageUpgrade_Mapping_V2_Bad {
    mapping (uint => uint) m1;
    mapping (bool => uint) m2;
}
