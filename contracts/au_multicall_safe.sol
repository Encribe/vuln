// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: plugin executor delegatecalls an owner-set target.
pragma solidity ^0.8.20;
contract MulticallSafe {
    address public owner;
    address public impl;
    constructor(address _impl) { owner = msg.sender; impl = _impl; }
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    function setImpl(address i) external onlyOwner { impl = i; }
    function exec(bytes calldata data) external onlyOwner returns (bytes memory) {
        (bool ok, bytes memory r) = impl.delegatecall(data);
        require(ok);
        return r;
    }
    receive() external payable {}
}
