// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), MasterChef style reward debt not updated on harvest
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Farm {
    IERC20 public immutable reward;
    uint256 public accPerShare;
    address public owner;
    mapping(address => uint256) public amount;
    mapping(address => uint256) public rewardDebt;
    constructor(IERC20 r) { reward = r; owner = msg.sender; }
    function notify(uint256 inc) external { require(msg.sender == owner); accPerShare += inc; }
    function deposit() external payable {
        _harvest();
        amount[msg.sender] += msg.value;
        rewardDebt[msg.sender] = amount[msg.sender] * accPerShare / 1e12;
    }
    function harvest() external {
        uint256 pending = amount[msg.sender] * accPerShare / 1e12 - rewardDebt[msg.sender];
        require(reward.transfer(msg.sender, pending));
    }
    function _harvest() internal {
        uint256 pending = amount[msg.sender] * accPerShare / 1e12 - rewardDebt[msg.sender];
        if (pending > 0) require(reward.transfer(msg.sender, pending));
    }
}
