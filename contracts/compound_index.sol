// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Minimized from Compound (September 2021, $147M, rekt "compound-rekt"):
// distributeSupplierComp read a supplier's index as 0 when it had never been
// set, so a fresh supplier was paid the whole index since the market began.
// The mechanism: a holder's accrued reward is at most its balance times the
// index growth since its own last checkpoint, and a fresh holder's
// checkpoint is the current index.
contract CompoundIndex {
    uint256 public index = 1e18;
    mapping(address => uint256) public balance;
    mapping(address => uint256) public userIndex;
    mapping(address => uint256) public accrued;

    function grow(uint256 d) external {
        index += d;
    }

    function supply(uint256 amount) external {
        accrue(msg.sender);
        balance[msg.sender] += amount;
    }

    // the recipient is not checkpointed, so its index stays at 0 until it accrues
    function transfer(address to, uint256 amount) external {
        accrue(msg.sender);
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function fund() external payable {}

    function claim() external {
        accrue(msg.sender);
        uint256 a = accrued[msg.sender];
        accrued[msg.sender] = 0;
        payable(msg.sender).transfer(a);
    }

    function accrue(address who) public {
        // the bug: a never-set userIndex reads 0, not the current index
        uint256 delta = index - userIndex[who];
        accrued[who] += balance[who] * delta / 1e18;
        userIndex[who] = index;
    }
}

