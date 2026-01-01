// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), claimed flag keyed by a caller chosen index
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract IndexedDrop {
    IERC20 public immutable token;
    address public owner;
    mapping(address => uint256) public allocation;
    mapping(uint256 => bool) public claimed;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function setAllocation(address a, uint256 v) external { require(msg.sender == owner); allocation[a] = v; }
    function claim(uint256 index) external {
        require(!claimed[index]);
        claimed[index] = true;
        require(token.transfer(msg.sender, allocation[msg.sender]));
    }
}
