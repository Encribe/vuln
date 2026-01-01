// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_StructGap_V1 {
    struct S {
        uint256 a;
        uint256 b;
        bytes32[50] __gap;
        uint256 d;
    }
    mapping(uint256 => S) store_mapping;
    S[10] store_fixed_array;
    S[] store_dynamic_array;
}

contract StorageUpgrade_StructGap_V2_Ok {
    struct S {
        uint256 a;
        uint256 b;
        uint256 c;
        bytes32[49] __gap;
        uint256 d;
    }
    mapping(uint256 => S) store_mapping;
    S[10] store_fixed_array;
    S[] store_dynamic_array;
}
