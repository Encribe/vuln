// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), liquidation without a health check (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Lender {
    IERC20 public immutable debtToken;
    mapping(address => uint256) public collateral;
    mapping(address => uint256) public debt;
    constructor(IERC20 d) { debtToken = d; }
    function depositCollateral() external payable { collateral[msg.sender] += msg.value; }
    function borrow(uint256 a) external {
        require((debt[msg.sender] + a) * 2 <= collateral[msg.sender]);
        debt[msg.sender] += a;
        require(debtToken.transfer(msg.sender, a));
    }
    function liquidate(address user) external {
        uint256 d = debt[user];
        uint256 c = collateral[user];
        require(d > 0 && d * 2 > c, "healthy");
        require(debtToken.transferFrom(msg.sender, address(this), d));
        debt[user] = 0;
        collateral[user] = 0;
        (bool ok, ) = msg.sender.call{value: c}("");
        require(ok);
    }
}
