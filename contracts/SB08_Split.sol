// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Splitter {
    address public a; address public b;
    constructor(address _a, address _b) { a = _a; b = _b; }
    receive() external payable {}
    function split() external {
        uint256 bal = address(this).balance;
        payable(a).transfer(bal / 2);
        payable(b).transfer(bal / 2);
        require(address(this).balance == 0, "dust"); // odd balance leaves 1 wei and reverts forever
    }
}
