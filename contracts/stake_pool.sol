// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Authored for the solbend calls-class corpus (no code copied).

interface IToken {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);
}

// A staking pool records a stake on a transferFrom whose answer is dropped,
// so a false answer records a stake nobody paid for and unstake pays it out
// of the other stakers' tokens.
contract StakePool {
    IToken public token;
    mapping(address => uint256) public staked;
    uint256 public total;

    constructor(address t) {
        token = IToken(t);
    }

    function stake(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        staked[msg.sender] += amount;
        total += amount;
    }

    function unstake(uint256 amount) external {
        require(staked[msg.sender] >= amount, "too much");
        staked[msg.sender] -= amount;
        total -= amount;
        require(token.transfer(msg.sender, amount), "transfer failed");
    }
}
