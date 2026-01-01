// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20Min {
    function balanceOf(address) external view returns (uint256);
    function transfer(address, uint256) external returns (bool);
}

// Minimized from Spartan Protocol (May 2021, $30.5M, rekt "spartan-rekt"):
// calcLiquidityHoldings priced a burn against the pool's live token balance,
// which anyone raises by a plain transfer, instead of its recorded reserve.
// The mechanism: a burn pays at most the burned share of the recorded
// reserve.
contract SpartanReserve {
    IERC20Min public immutable token;
    uint256 public reserve;
    uint256 public totalSupply;
    mapping(address => uint256) public shares;

    constructor(IERC20Min t) {
        token = t;
    }

    function removeLiquidity(uint256 units) external {
        // the bug: the live balance, not the recorded reserve
        uint256 out = units * token.balanceOf(address(this)) / totalSupply;
        shares[msg.sender] -= units;
        totalSupply -= units;
        reserve -= out;
        require(token.transfer(msg.sender, out));
    }
}

