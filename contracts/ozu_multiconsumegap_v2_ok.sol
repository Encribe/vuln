// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_MultiConsumeGap_V1 {
    uint256[2] __gap;
}

contract StorageUpgrade_MultiConsumeGap_V2_Ok {
    uint256 a;
    uint256 b;
}
