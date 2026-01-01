// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Gap_One_Element_V1 {
    uint256 a;
    uint256 b;
    uint256[1] __gap;
    uint256 z;
}

contract StorageUpgrade_Gap_One_Element_V2_Bad {
    uint256 a;
    uint256 b;
    uint256 c;
    uint256[1] __gap;
    uint256 z;
}
