// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), payer parameter in a zap contract (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Zap {
    IERC20 public immutable token;
    mapping(address => uint256) public shares;
    constructor(IERC20 t) { token = t; }
    function zapIn(address beneficiary, uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount));
        shares[beneficiary] += amount;
    }
}
