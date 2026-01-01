// SPDX-License-Identifier: MIT
// The vault-inflation class's second safe fixture (docs/classes/vault-inflation.md):
// the share price reads tracked assets, never the token balance. The
// zero-share revert is removed. It stays safe: totalAssets <= totalSupply is
// inductive (withdraw rounds down), so a deposit of 1 or more mints 1 or more.
pragma solidity ^0.8.26;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract VaultTrackedNoFloor {
    IERC20 public immutable token;
    uint256 public totalSupply;
    uint256 public totalAssets;
    mapping(address => uint256) public balanceOf;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external returns (uint256 shares) {
        shares = totalSupply == 0 ? amount : amount * totalSupply / totalAssets;
        totalSupply += shares;
        totalAssets += amount;
        balanceOf[msg.sender] += shares;
        require(token.transferFrom(msg.sender, address(this), amount));
    }

    function withdraw(uint256 shares) external returns (uint256 amount) {
        amount = shares * totalAssets / totalSupply;
        totalSupply -= shares;
        totalAssets -= amount;
        balanceOf[msg.sender] -= shares;
        require(token.transfer(msg.sender, amount));
    }
}
