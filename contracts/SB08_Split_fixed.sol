// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Splitter {
    address public a; address public b;
    constructor(address _a, address _b) { a = _a; b = _b; }
    receive() external payable {}
    function split() external {
        uint256 bal = address(this).balance;
        uint256 half = bal / 2;
        payable(a).transfer(half);
        payable(b).transfer(bal - half);
    }
}
