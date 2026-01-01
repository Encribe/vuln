// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SAFE: the credit is what arrived, measured as the growth of the vault's own balance, so a token that keeps a fee on transfer credits the depositor only what the vault received. fee-token class: PROVEN under the default token model (fee).
interface IERC20FV {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract FeeVaultMeasured {
    IERC20FV public immutable token;
    mapping(address => uint256) public credited;

    constructor(address t) {
        token = IERC20FV(t);
    }

    function deposit(uint256 amount) external {
        uint256 before = token.balanceOf(address(this));
        require(token.transferFrom(msg.sender, address(this), amount));
        uint256 got = token.balanceOf(address(this)) - before;
        credited[msg.sender] += got;
    }

    function withdraw(uint256 amount) external {
        require(credited[msg.sender] >= amount);
        credited[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount));
    }
}
