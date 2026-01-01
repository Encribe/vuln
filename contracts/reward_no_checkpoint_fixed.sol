// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), reward per token without a per user checkpoint (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract StakingRewards {
    IERC20 public immutable reward;
    address public owner;
    uint256 public rewardPerToken;
    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public userRpt;
    mapping(address => uint256) public earned;
    constructor(IERC20 r) { reward = r; owner = msg.sender; }
    function notify(uint256 inc) external { require(msg.sender == owner); rewardPerToken += inc; }
    function _update(address a) internal {
        earned[a] += balanceOf[a] * (rewardPerToken - userRpt[a]) / 1e18;
        userRpt[a] = rewardPerToken;
    }
    function stake() external payable { _update(msg.sender); balanceOf[msg.sender] += msg.value; }
    function getReward() external {
        _update(msg.sender);
        uint256 due = earned[msg.sender];
        earned[msg.sender] = 0;
        require(reward.transfer(msg.sender, due));
    }
}
