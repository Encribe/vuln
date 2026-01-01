// SPDX-License-Identifier: MIT
// Extracted from OpenZeppelin Upgrades packages/core/contracts/test/Storage.sol (MIT). Old version and new version of one upgrade.
pragma solidity ^0.6.8;

contract StorageUpgrade_StructEnum_V1 {
    enum MyEnum { State1, State2 }

    struct MyStruct {
        uint256 id;
        string title;
        string body;
        uint256 votesFor;
        uint256 votesAgainst;
        address[] votesForAddr;
        address[] votesAgainstAddr;
        address owner;
        MyEnum myEnum;
    }
    MyStruct[] public structs;
}

contract StorageUpgrade_StructEnum_V2 {
    enum MyEnum { State1, State2 }

    struct MyStruct {
        uint256 id;
        string title;
        string body;
        uint256 votesFor;
        uint256 votesAgainst;
        address[] votesForAddr;
        address[] votesAgainstAddr;
        address owner;
        MyEnum myEnum;
    }
    MyStruct[] public structs;
}
