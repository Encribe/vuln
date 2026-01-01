// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_AddressGap_V1 {
    address a;
    address b;
    address[48] __gap;
    address z;
}

contract StorageUpgrade_AddressGap_V2 {
    address a;
    address b;
    address c;
    address[47] __gap;
    address z;
}
