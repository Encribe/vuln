// SPDX-License-Identifier: MIT
// Derived fix of solidity-by-example.org VaultInflation.sol (MIT): the share
// price uses internally tracked assets, so a direct token donation does not
// move it.
pragma solidity ^0.8.26;

interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract VaultInternalAccounting {
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
