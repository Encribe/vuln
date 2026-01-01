// SPDX-License-Identifier: MIT
// Fixed counterpart of solidity-by-example hacks/delegatecall Delegatecall_1.sol: the library has no owner writer and the fallback is gone, authored for the solbend class benchmark.
pragma solidity ^0.8.26;
contract Lib {
    address public owner;
    uint256 public hits;
    function ping() public { hits += 1; }
}
contract HackMe {
    address public owner;
    uint256 public hits;
    Lib public lib;
    constructor(Lib _lib) { owner = msg.sender; lib = Lib(_lib); }
    function ping() external { (bool ok,) = address(lib).delegatecall(abi.encodeWithSignature("ping()")); require(ok); }
}
