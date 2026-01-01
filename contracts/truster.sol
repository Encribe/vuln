// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/truster/TrusterLenderPool.sol
// License: MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract TrusterLenderPool {
    IERC20 public immutable token;
    bool private locked;
    constructor(IERC20 t) { token = t; }
    function flashLoan(uint256 amount, address borrower, address target, bytes calldata data) external returns (bool) {
        require(!locked); locked = true;
        uint256 before = token.balanceOf(address(this));
        token.transfer(borrower, amount);
        (bool ok, ) = target.call(data);
        require(ok, "call failed");
        require(token.balanceOf(address(this)) >= before, "RepayFailed");
        locked = false;
        return true;
    }
}
