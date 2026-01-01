// SPDX-License-Identifier: MIT
// Fixed counterpart of Ethernaut Delegation: the fallback no longer forwards arbitrary calldata to a library that writes owner, authored for the solbend class benchmark.
pragma solidity ^0.8.0;
contract Delegate {
    address public owner;
    uint256 public counter;
    function bump() public { counter += 1; }
}
contract Delegation {
    address public owner;
    uint256 public counter;
    Delegate delegate;
    constructor(address _delegateAddress) { delegate = Delegate(_delegateAddress); owner = msg.sender; }
    function bump() external {
        (bool result,) = address(delegate).delegatecall(abi.encodeWithSignature("bump()"));
        require(result);
    }
}
