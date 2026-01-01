// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A constant-product swap with no caller bound on what it pays out: another user's swap first lowers this one's output, both orders succeed, and the victim's balanceOf is lower than in a control from the same state. The pair is a sandwich's first half, the class must come out FOUND with a measured loss.
contract OrderSwapNoSlip {
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public other;
    uint256 public rx = 1000;
    uint256 public ry = 1000;

    function fund(uint256 a) external {
        require(a <= 100, "cap");
        other[msg.sender] += a;
    }

    function swap(uint256 a) external {
        require(other[msg.sender] >= a, "funds");
        uint256 out = ry * a / (rx + a);
        
        other[msg.sender] -= a;
        rx += a;
        ry -= out;
        balanceOf[msg.sender] += out;
    }
}
