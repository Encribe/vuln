// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/extensions/ERC4626.sol (virtual shares offset, reduced to one file)
// License: MIT (OpenZeppelin). Pattern reduced to one file, code written for this benchmark
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Vault4626 {
    IERC20 public immutable asset;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    uint256 internal constant OFFSET = 1e6;
    constructor(IERC20 a) { asset = a; }
    function totalAssets() public view returns (uint256) { return asset.balanceOf(address(this)); }
    function deposit(uint256 assets) external returns (uint256 shares) {
        shares = assets * (totalSupply + OFFSET) / (totalAssets() + 1);
        require(shares > 0, "zero shares");
        require(asset.transferFrom(msg.sender, address(this), assets));
        totalSupply += shares; balanceOf[msg.sender] += shares;
    }
    function redeem(uint256 shares) external returns (uint256 assets) {
        assets = shares * (totalAssets() + 1) / (totalSupply + OFFSET);
        balanceOf[msg.sender] -= shares; totalSupply -= shares;
        require(asset.transfer(msg.sender, assets));
    }
}
