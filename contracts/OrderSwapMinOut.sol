// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The same swap with a caller-supplied min-out checked on the result. Another user's swap first can make this one revert on its own bound, which is the caller's own checked revert and never a harm (found-needs-harm). The class may read NOT PROVEN (the state depends on order), never FOUND.
contract OrderSwapMinOut {
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public other;
    uint256 public rx = 1000;
    uint256 public ry = 1000;

    function fund(uint256 a) external {
        require(a <= 100, "cap");
        other[msg.sender] += a;
    }

    function swap(uint256 a, uint256 minOut) external {
        require(other[msg.sender] >= a, "funds");
        uint256 out = ry * a / (rx + a);
        require(out >= minOut, "slippage");
        other[msg.sender] -= a;
        rx += a;
        ry -= out;
        balanceOf[msg.sender] += out;
    }
}
