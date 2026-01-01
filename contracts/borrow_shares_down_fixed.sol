// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), debt shares rounded down on borrow (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract DebtPool {
    IERC20 public immutable asset;
    uint256 public totalDebt = 1;
    uint256 public totalDebtShares = 1;
    mapping(address => uint256) public debtShares;
    mapping(address => uint256) public collateral;
    constructor(IERC20 a) { asset = a; }
    function addCollateral() external payable { collateral[msg.sender] += msg.value; }
    function borrow(uint256 amount) external {
        uint256 s = (amount * totalDebtShares + totalDebt - 1) / totalDebt;
        debtShares[msg.sender] += s; totalDebtShares += s; totalDebt += amount;
        require(debtShares[msg.sender] * totalDebt / totalDebtShares <= collateral[msg.sender]);
        require(asset.transfer(msg.sender, amount));
    }
    function accrue(uint256 interest) external { totalDebt += interest; }
}
