// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The flash-loan governance class's safe pattern, as the class law states it
// (solbend/src/flashgov_law.ts): every entry that moves a voter's weight
// stamps since[voter] with the block number, and vote() counts the weight
// only when the stamp is older than the proposal's start block, which is at
// most the current block. A weight deposited in this transaction carries this
// block's stamp, so vote() refuses it: a flash loan never reaches `yes`.
// treasury is the third party's ETH that execute() pays out.
contract FgCheckpointGov {
    uint256 public constant QUORUM = 100 ether;

    mapping(address => uint256) public weight;
    mapping(address => uint256) public since;
    mapping(address => bool) public voted;
    uint256 public start;
    uint256 public yes;
    uint256 public treasury;
    address public target;
    bool public done;

    function fund() external payable {
        treasury += msg.value;
    }

    function deposit() external payable {
        weight[msg.sender] += msg.value;
        since[msg.sender] = block.number;
    }

    function withdraw(uint256 amount) external {
        require(weight[msg.sender] >= amount, "too much");
        weight[msg.sender] -= amount;
        since[msg.sender] = block.number;
        payable(msg.sender).transfer(amount);
    }

    function propose(address to) external {
        require(start == 0, "one proposal");
        start = block.number;
        target = to;
    }

    function vote() external {
        require(start != 0 && start <= block.number, "not open");
        require(since[msg.sender] < start, "weight moved after the start");
        require(!voted[msg.sender], "voted");
        voted[msg.sender] = true;
        yes += weight[msg.sender];
    }

    function execute() external {
        require(!done && yes >= QUORUM, "no quorum");
        done = true;
        uint256 amount = treasury;
        treasury = 0;
        payable(target).transfer(amount);
    }
}
