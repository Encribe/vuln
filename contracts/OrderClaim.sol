// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A claim that credits the caller ten tokens from a pool, and a close that
// stops every later claim. close() by one user makes another user's claim()
// fail where it succeeded alone, and the difference is the ten tokens the
// claim would have credited: the victim's balanceOf is ten lower in the
// attack than in a control run from the same snapshot. The block law with a
// measured loss to another account, so the class must be FOUND.
contract OrderClaim {
    mapping(address => uint256) public balanceOf;
    uint256 public pool = 1000;
    bool public closed;

    function close() external {
        closed = true;
    }

    function claim() external {
        require(!closed, "closed");
        require(pool >= 10, "pool");
        pool -= 10;
        balanceOf[msg.sender] += 10;
    }
}
