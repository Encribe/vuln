// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The OpenZeppelin Governor and Compound GovernorBravo shape: the weight is a
// token's checkpoint at the block before the proposal started
// (getPastVotes, Compound's getPriorVotes). Safe in practice when the token
// is an honest ERC20Votes, but the weight is another contract's answer, which
// the single-contract model states nothing of. The class law refuses it and
// names the gap (docs/soundness.md item 11942): never PROVEN here.
interface IVotes {
    function getPastVotes(address account, uint256 blockNumber) external view returns (uint256);
}

contract FgPastVotesGov {
    uint256 public constant QUORUM = 100 ether;

    IVotes public immutable token;
    mapping(address => bool) public voted;
    uint256 public start;
    uint256 public yes;
    uint256 public treasury;
    address public target;
    bool public done;

    constructor(IVotes t) {
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
        yes += token.getPastVotes(msg.sender, start - 1);
    }

    function execute() external {
        require(!done && yes >= QUORUM, "no quorum");
        done = true;
        uint256 amount = treasury;
        treasury = 0;
        payable(target).transfer(amount);
    }
}
