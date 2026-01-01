// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), ERC4626 mint rounding in the user's favour (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract MintPool {
    IERC20 public immutable asset;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    constructor(IERC20 a) { asset = a; }
    function totalAssets() public view returns (uint256) { return asset.balanceOf(address(this)); }
    function mint(uint256 shares) external {
        uint256 assets = totalSupply == 0 ? shares : (shares * totalAssets() + totalSupply - 1) / totalSupply;
        require(asset.transferFrom(msg.sender, address(this), assets));
        totalSupply += shares; balanceOf[msg.sender] += shares;
    }
    function redeem(uint256 shares) external {
        uint256 assets = shares * totalAssets() / totalSupply;
        balanceOf[msg.sender] -= shares; totalSupply -= shares;
        require(asset.transfer(msg.sender, assets));
    }
}
