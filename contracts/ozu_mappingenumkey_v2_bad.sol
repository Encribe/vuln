// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract Storage1 {
  uint u1 = 0;
  uint constant u2 = 0;
  uint immutable u3 = 0;

  address a1 = address(0);
  address constant a2 = address(0);
  address immutable a3 = address(0);

  mapping (uint => uint) m1;

  uint[3] us1;
}

enum E1 { A, B }

enum E2_Bad { X, Y }

contract StorageUpgrade_MappingEnumKey_V1 {
    mapping (E1 => uint) m1;
    mapping (E1 => uint) m2;
    mapping (uint8 => uint) m3;
    mapping (Storage1 => uint) m4;
}

contract StorageUpgrade_MappingEnumKey_V2_Bad {
    mapping (E1 => uint) m1;
    mapping (E2_Bad => uint) m2;
    mapping (E1 => uint) m3;
    mapping (uint => uint) m4;
}
