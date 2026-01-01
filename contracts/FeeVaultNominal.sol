// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// BUGGY twin of FeeVaultMeasured: the credit is the amount named. With a token that keeps a fee, the vault holds less than it owes, and the first withdrawers are paid out of later depositors' tokens. fee-token class: FOUND under --replay-evm (fee replay against a standard-token control).
interface IERC20FV {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}

contract FeeVaultNominal {
    IERC20FV public immutable token;
    mapping(address => uint256) public credited;

    constructor(address t) {
        token = IERC20FV(t);
    }

    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount));
        credited[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(credited[msg.sender] >= amount);
        credited[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount));
    }
}
