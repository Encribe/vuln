// SPDX-License-Identifier: MIT
// The vault-inflation class's safe fixture (docs/classes/vault-inflation.md):
// the share price reads tracked assets, never the token balance, and a
// deposit that would mint no shares reverts.
pragma solidity ^0.8.26;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract VaultTracked {
    IERC20 public immutable token;
    uint256 public totalSupply;
    uint256 public totalAssets;
    mapping(address => uint256) public balanceOf;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external returns (uint256 shares) {
        shares = totalSupply == 0 ? amount : amount * totalSupply / totalAssets;
        require(shares > 0, "zero shares");
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
