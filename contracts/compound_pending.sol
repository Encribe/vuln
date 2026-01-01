// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pending rewards spent by one path and not cleared
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Staker {
    IERC20 public immutable token;
    address public owner;
    mapping(address => uint256) public stake;
    mapping(address => uint256) public pending;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function addReward(address a, uint256 v) external { require(msg.sender == owner); pending[a] += v; }
    function claim() external {
        uint256 v = pending[msg.sender];
        pending[msg.sender] = 0;
        require(token.transfer(msg.sender, v));
    }
    function compound() external { stake[msg.sender] += pending[msg.sender]; }
    function unstake(uint256 a) external { stake[msg.sender] -= a; require(token.transfer(msg.sender, a)); }
}
