// SPDX-License-Identifier: MIT
// Fixed counterpart of Slither tests controlled-delegatecall/0.7.6, keeping only the delegatecall to the constant target, authored for the solbend class benchmark.
pragma solidity 0.7.6;
contract C {
    address constant addr_good = address(0x41);
    function good_delegate_call(bytes memory data) public {
        addr_good.delegatecall(abi.encode(bytes4(""), data));
    }
}
