// SPDX-License-Identifier: MIT
// Derived fix of solidity-by-example.org VaultInflation.sol (MIT) using the
// virtual shares and assets offset that OpenZeppelin ERC4626 (MIT) adopted
// against the donation inflation attack.
pragma solidity ^0.8.26;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract VaultVirtualShares {
    uint256 private constant OFFSET = 1e6;
    IERC20 public immutable token;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external returns (uint256 shares) {
        shares = amount * (totalSupply + OFFSET) / (token.balanceOf(address(this)) + 1);
        require(shares > 0, "zero shares");
        totalSupply += shares;
        balanceOf[msg.sender] += shares;
        require(token.transferFrom(msg.sender, address(this), amount));
    }

    function withdraw(uint256 shares) external returns (uint256 amount) {
        amount = shares * (token.balanceOf(address(this)) + 1) / (totalSupply + OFFSET);
        totalSupply -= shares;
        balanceOf[msg.sender] -= shares;
        require(token.transfer(msg.sender, amount));
    }
}
