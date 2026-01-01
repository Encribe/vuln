// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Access law, safe row (docs/classes/access-control.md, "The access law").
// Depositors hold ETH. The owner is set once by initialize, which a set
// flag closes for good, and only the owner may move the owner, set the fee
// or pause. Nobody else can change a privileged field: PROVEN on ACC.bend.
contract AlVaultSafe {
    address public owner;
    uint256 public fee;
    bool public paused;
    bool public initialized;
    mapping(address => uint256) public balanceOf;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor() {
        initialized = true;
        owner = msg.sender;
    }

    function initialize(address o) external {
        require(!initialized, "done");
        initialized = true;
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
