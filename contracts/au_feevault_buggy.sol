// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: fee vault whose sweep lacks an access check.
pragma solidity ^0.8.20;
contract FeeVaultBuggy {
    address public owner;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    receive() external payable {}
    function sweep(address payable to) external {
        (bool ok,) = to.call{value: address(this).balance}("");
        require(ok);
    }
}
