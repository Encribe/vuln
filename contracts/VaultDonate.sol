// SPDX-License-Identifier: MIT
// The vault-inflation class's buggy fixture (docs/classes/vault-inflation.md),
// the solidity-by-example.org VaultInflation shape (MIT): shares are priced
// from the token balance, so a first deposit of 1 wei and a donation round
// the next deposit down to zero shares.
pragma solidity ^0.8.26;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract VaultDonate {
    IERC20 public immutable token;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external {
        uint256 shares;
        if (totalSupply == 0) {
            shares = amount;
        } else {
            shares = (amount * totalSupply) / token.balanceOf(address(this));
        }
        totalSupply += shares;
        balanceOf[msg.sender] += shares;
        require(token.transferFrom(msg.sender, address(this), amount));
    }

    function withdraw(uint256 shares) external returns (uint256) {
        uint256 amount = (shares * token.balanceOf(address(this))) / totalSupply;
        totalSupply -= shares;
        balanceOf[msg.sender] -= shares;
        require(token.transfer(msg.sender, amount));
        return amount;
    }
}
