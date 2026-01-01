// SPDX-License-Identifier: MIT
// Fixed counterpart of Not So Smart Contracts unprotected_function/Unprotected.sol (unprotected changeOwner removed), authored for the solbend class benchmark.
pragma solidity ^0.4.15;
contract UnprotectedFixed {
    address private owner;
    modifier onlyowner { require(msg.sender == owner); _; }
    function UnprotectedFixed() public { owner = msg.sender; }
    function changeOwner(address _newOwner) public onlyowner { owner = _newOwner; }
}
