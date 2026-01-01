// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/shards/ShardsNFTMarketplace.sol
// License: MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. ERC1155, oracle and fees removed
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract ShardsMarket {
    IERC20 public immutable paymentToken;
    uint256 public constant TOTAL = 10_000_000e18;
    uint256 public immutable price;
    mapping(address => uint256) public shards;
    uint256 public sold;
    constructor(IERC20 p, uint256 pr) { paymentToken = p; price = pr; }
    function fill(uint256 want) external {
        require(sold + want <= TOTAL);
        sold += want;
        shards[msg.sender] += want;
        require(paymentToken.transferFrom(msg.sender, address(this), want * price / TOTAL));
    }
    function cancel(uint256 n) external {
        shards[msg.sender] -= n;
        sold -= n;
        require(paymentToken.transfer(msg.sender, (n * price + TOTAL - 1) / TOTAL));
    }
}
