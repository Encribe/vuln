// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The buggy external-token shape: the weight is the token balance now
// (balanceOf), which a flash loan of the token raises within the vote's own
// transaction. The weight is another contract's answer, so the class law
// refuses it (docs/soundness.md item 11942), and the single-contract replay
// has no token to borrow: a named gap, never PROVEN and not yet FOUND.
interface IBalance {
    function balanceOf(address account) external view returns (uint256);
}

contract FgBalanceOfGov {
    uint256 public constant QUORUM = 100 ether;

    IBalance public immutable token;
    mapping(address => bool) public voted;
    uint256 public start;
    uint256 public yes;
    uint256 public treasury;
    address public target;
    bool public done;

    constructor(IBalance t) {
        token = t;
    }

    function fund() external payable {
        treasury += msg.value;
    }

    function propose(address to) external {
        require(start == 0, "one proposal");
        start = block.number;
        target = to;
    }

    function vote() external {
        require(start != 0 && start < block.number, "not open");
        require(!voted[msg.sender], "voted");
        voted[msg.sender] = true;
        yes += token.balanceOf(msg.sender);
    }

    function execute() external {
        require(!done && yes >= QUORUM, "no quorum");
        done = true;
        uint256 amount = treasury;
        treasury = 0;
        payable(target).transfer(amount);
    }
}
