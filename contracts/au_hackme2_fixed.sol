// SPDX-License-Identifier: MIT
// Fixed counterpart of solidity-by-example hacks/delegatecall Delegatecall_2.sol: the library mirrors the caller layout, authored for the solbend class benchmark.
pragma solidity ^0.8.26;
contract Lib {
    address public lib;
    address public owner;
    uint256 public someNumber;
    function doSomething(uint256 _num) public { someNumber = _num; }
}
contract HackMe {
    address public lib;
    address public owner;
    uint256 public someNumber;
    constructor(address _lib) { lib = _lib; owner = msg.sender; }
    function doSomething(uint256 _num) public { lib.delegatecall(abi.encodeWithSignature("doSomething(uint256)", _num)); }
}
