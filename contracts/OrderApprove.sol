// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The approve race (SWC-114): the owner's approve that lowers an allowance
// makes the spender's transferFrom of the old allowance fail. The supply
// starts with the deployer, and no allowance exists until an account sets
// one, so only a state the deployment's accounts reach by plain calls (the
// seed, soundness.md item 10124) drives it: the block law must be FOUND.
contract OrderApprove {
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() {
        balanceOf[msg.sender] = 1000;
    }

    function approve(address s, uint256 v) external returns (bool) {
        allowance[msg.sender][s] = v;
        return true;
    }

    function transferFrom(address f, address t, uint256 v) external returns (bool) {
        require(allowance[f][msg.sender] >= v, "allowance");
        require(balanceOf[f] >= v, "balance");
        allowance[f][msg.sender] -= v;
        balanceOf[f] -= v;
        balanceOf[t] += v;
        return true;
    }
}
