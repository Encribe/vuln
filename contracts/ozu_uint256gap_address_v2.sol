// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Uint256Gap_Address_V1 {
    address a;
    address b;
    uint256[48] __gap;
    address z;
}

contract StorageUpgrade_Uint256Gap_Address_V2 {
    address a;
    address b;
    address c;
    uint256[47] __gap;
    address z;
}
