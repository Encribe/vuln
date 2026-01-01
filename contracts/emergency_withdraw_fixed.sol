// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), MasterChef fork emergencyWithdraw that keeps the stake (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Chef {
    IERC20 public immutable lp;
    mapping(address => uint256) public amount;
    constructor(IERC20 t) { lp = t; }
    function deposit(uint256 a) external { require(lp.transferFrom(msg.sender, address(this), a)); amount[msg.sender] += a; }
    function withdraw(uint256 a) external { amount[msg.sender] -= a; require(lp.transfer(msg.sender, a)); }
    function emergencyWithdraw() external {
        uint256 a = amount[msg.sender];
        amount[msg.sender] = 0;
        require(lp.transfer(msg.sender, a));
    }
}
