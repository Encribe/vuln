// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Authored for the solbend calls-class corpus (no code copied).

interface IToken {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    function transfer(address to, uint256 amount) external returns (bool);
}

// The fixed twin: the transferFrom answer is required, so a false answer reverts the deposit.
contract PullDeposit {
    IToken public token;
    mapping(address => uint256) public credit;

    constructor(address t) {
        token = IToken(t);
    }

    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "transferFrom failed");
        credit[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        credit[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "transfer failed");
    }
}
