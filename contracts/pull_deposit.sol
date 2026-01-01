// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Authored for the solbend calls-class corpus (no code copied).

interface IToken {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);
}

// A vault credits a deposit on a transferFrom whose returned bool is dropped
// (Sherlock 2023-01 Cooler H-1 shape). A token that answers false credits
// the caller with nothing paid, and withdraw then pays out other users' tokens.
contract PullDeposit {
    IToken public token;
    mapping(address => uint256) public credit;

    constructor(address t) {
        token = IToken(t);
    }

    function deposit(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        credit[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        credit[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "transfer failed");
    }
}
