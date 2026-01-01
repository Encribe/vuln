// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), ERC4626 withdraw rounding in the user's favour (EIP-4626 rounding rules)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract SharePool {
    IERC20 public immutable asset;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    constructor(IERC20 a) { asset = a; }
    function totalAssets() public view returns (uint256) { return asset.balanceOf(address(this)); }
    function deposit(uint256 assets) external {
        uint256 s = totalSupply == 0 ? assets : assets * totalSupply / totalAssets();
        require(asset.transferFrom(msg.sender, address(this), assets));
        totalSupply += s; balanceOf[msg.sender] += s;
    }
    function withdraw(uint256 assets) external {
        uint256 s = assets * totalSupply / totalAssets();
        balanceOf[msg.sender] -= s; totalSupply -= s;
        require(asset.transfer(msg.sender, assets));
    }
}
