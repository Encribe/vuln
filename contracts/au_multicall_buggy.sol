// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: plugin executor delegatecalls a caller-chosen target.
pragma solidity ^0.8.20;
contract MulticallBuggy {
    address public owner;
    address public impl;
    constructor(address _impl) { owner = msg.sender; impl = _impl; }
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    function setImpl(address i) external onlyOwner { impl = i; }
    function exec(address target, bytes calldata data) external returns (bytes memory) {
        (bool ok, bytes memory r) = target.delegatecall(data);
        require(ok);
        return r;
    }
    receive() external payable {}
}
