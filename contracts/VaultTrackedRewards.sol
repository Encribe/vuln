// SPDX-License-Identifier: MIT
// The vault-inflation class's mutant fixture (docs/classes/vault-inflation.md):
// VaultTracked plus an addRewards entry that raises the tracked assets and
// mints no shares. The fill part of the law fails at addRewards: a first
// deposit of 1 wei and a large addRewards round a later deposit to zero
// shares through the vault's own entry, with no balance read.
pragma solidity ^0.8.26;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract VaultTrackedRewards {
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

    function addRewards(uint256 amount) external {
        totalAssets += amount;
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
