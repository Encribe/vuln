// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The flash-loan governance class's buggy twin of FgCheckpointGov.sol: vote()
// counts weight[msg.sender] as it is now, with no stamp of the block it last
// moved. One transaction can borrow ETH, deposit it, vote, execute the
// proposal that pays the treasury (a third party's ETH) to the attacker,
// withdraw the deposit and repay the loan.
contract FgBalanceGov {
    uint256 public constant QUORUM = 100 ether;

    mapping(address => uint256) public weight;
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
    }

    function withdraw(uint256 amount) external {
        require(weight[msg.sender] >= amount, "too much");
        weight[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function propose(address to) external {
        require(start == 0, "one proposal");
        start = block.number;
        target = to;
    }

    function vote() external {
        require(start != 0 && start <= block.number, "not open");
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
