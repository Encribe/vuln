// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: fee vault whose sweep is owner only.
pragma solidity ^0.8.20;
contract FeeVaultFixed {
    address public owner;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    receive() external payable {}
    function sweep(address payable to) external onlyOwner {
        (bool ok,) = to.call{value: address(this).balance}("");
        require(ok);
    }
}
