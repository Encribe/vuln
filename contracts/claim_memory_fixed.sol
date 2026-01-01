// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), claimed flag written to a memory copy (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Rewards {
    struct Grant { uint256 amount; bool claimed; }
    IERC20 public immutable token;
    address public owner;
    mapping(address => Grant) public grants;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function grant(address a, uint256 v) external { require(msg.sender == owner && grants[a].amount == 0); grants[a].amount = v; }
    function claim() external {
        Grant storage g = grants[msg.sender];
        require(!g.claimed && g.amount > 0);
        g.claimed = true;
        require(token.transfer(msg.sender, g.amount));
    }
}
