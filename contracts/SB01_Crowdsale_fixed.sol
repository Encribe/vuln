// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Crowdsale {
    uint256 public constant GOAL = 100 ether;
    address public owner = msg.sender;
    bool public finalized;
    function contribute() external payable {}
    function finalize() external {
        require(address(this).balance >= GOAL, "goal not reached");
        finalized = true;
        payable(owner).transfer(address(this).balance);
    }
}
