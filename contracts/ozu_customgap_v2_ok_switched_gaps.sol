// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_CustomGap_V1 {
    uint256 a;
    uint256[24] __gap_part1;
    uint256 b;
    uint256 c;
    uint256[23] __gap_part2;
    uint256 z;
}

contract StorageUpgrade_CustomGap_V2_Ok_Switched_Gaps {
    uint256 a;
    uint256 a1;
    uint256[23] __gap_part2; // gap name changes are ok as long as gaps are used properly
    uint256 b;
    uint256 c;
    uint256 c1;
    uint256 c2;
    uint256[21] __gap_part1; // gap name changes are ok as long as gaps are used properly
    uint256 z;
}
