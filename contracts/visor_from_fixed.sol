// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20Min {
    function transferFrom(address, address, uint256) external returns (bool);
    function transfer(address, uint256) external returns (bool);
}

interface IOwned {
    function owner() external view returns (address);
}

// Minimized from Visor Finance (December 2021, $8.2M, rekt
// "visor-finance-rekt"): deposit accepted a caller-chosen `from` contract,
// checked only that from.owner() was the caller, and minted shares without
// pulling a token. The mechanism: a credit of shares is matched by assets
// the pool received in the same call.

contract VisorFromFixed {
    IERC20Min public immutable token;
    mapping(address => uint256) public shares;
    uint256 public totalShares;

    constructor(IERC20Min t) {
        token = t;
    }

    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount));
        shares[msg.sender] += amount;
        totalShares += amount;
    }

    function withdraw(uint256 amount) external {
        shares[msg.sender] -= amount;
        totalShares -= amount;
        require(token.transfer(msg.sender, amount));
    }
}
