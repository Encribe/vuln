// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_Equal_V1 {
  uint x1;
  function foo() external {}
}

contract StorageUpgrade_Equal_V2 {
  uint x1;
  function foo() external {}
  function bar() external {}
}
