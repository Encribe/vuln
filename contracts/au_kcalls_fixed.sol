// SPDX-License-Identifier: MIT
// Fixed counterpart of Mythril tests kcalls.sol, the delegatecall target is fixed at deployment, authored for the solbend class benchmark.
pragma solidity ^0.5.0;
contract KcallsFixed {
    uint public n;
    address public sender;
    address public lib;
    constructor(address _lib) public { lib = _lib; }
    function delegatecallSetN(uint _n) public {
        lib.delegatecall(abi.encodeWithSignature("setN(uint256)", _n));
    }
}
