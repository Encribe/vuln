// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Access law, buggy twin of AlVaultSafe: initialize has no one-way flag, so
// anyone calls it again, names itself owner and sweeps the depositors' ETH
// (FOUND, the victim's loss measured against a control).
contract AlVaultReinit {
    address public owner;
    uint256 public fee;
    bool public paused;
    mapping(address => uint256) public balanceOf;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function initialize(address o) external {
        owner = o;
    }

    function setFee(uint256 f) external onlyOwner {
        fee = f;
    }

    function setPaused(bool p) external onlyOwner {
        paused = p;
    }

    function transferOwnership(address o) external onlyOwner {
        owner = o;
    }

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    function sweep() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
