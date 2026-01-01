// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/the-rewarder/TheRewarderDistributor.sol (fixed version written for this benchmark)
// License: MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. The merkle proof is replaced by an owner set allocation
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract RewardDistributor {
    IERC20 public immutable token;
    address public owner;
    mapping(uint256 => address) public claimant;
    mapping(uint256 => uint256) public amountOf;
    mapping(uint256 => bool) public claimed;
    constructor(IERC20 t) { token = t; owner = msg.sender; }
    function add(uint256 id, address who, uint256 amount) external { require(msg.sender == owner && claimant[id] == address(0)); claimant[id] = who; amountOf[id] = amount; }
    function claimRewards(uint256[] calldata ids) external {
        uint256 total;
        for (uint256 i = 0; i < ids.length; i++) {
            require(claimant[ids[i]] == msg.sender && !claimed[ids[i]]);
            claimed[ids[i]] = true;
            total += amountOf[ids[i]];
        }
        require(token.transfer(msg.sender, total));
    }
}
