// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), airdrop without a claimed flag (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Airdrop {
    IERC20 public immutable token;
    address public owner;
    mapping(address => uint256) public allocation;
    mapping(address => bool) public claimed;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function setAllocation(address a, uint256 v) external { require(msg.sender == owner); require(!claimed[a]); allocation[a] = v; }
    function claim() external {
        uint256 v = allocation[msg.sender];
        require(v > 0 && !claimed[msg.sender]);
        claimed[msg.sender] = true;
        require(token.transfer(msg.sender, v));
    }
}
