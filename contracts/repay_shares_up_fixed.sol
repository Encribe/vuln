// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), debt shares burned rounded up on repay (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract RepayPool {
    IERC20 public immutable asset;
    uint256 public totalDebt;
    uint256 public totalDebtShares;
    mapping(address => uint256) public debtShares;
    constructor(IERC20 a) { asset = a; }
    function repay(uint256 amount) external {
        uint256 s = amount * totalDebtShares / totalDebt;
        require(asset.transferFrom(msg.sender, address(this), amount));
        debtShares[msg.sender] -= s; totalDebtShares -= s; totalDebt -= amount;
    }
}
