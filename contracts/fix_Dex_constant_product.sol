// SPDX-License-Identifier: MIT
// Derived fix of Ethernaut Dex.sol (file header MIT, repository AGPL-3.0): the
// swap output follows the constant-product rule on internally tracked reserves,
// so a trader cannot use the pool's own balance ratio against it.
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract DexConstantProduct {
    address public owner;
    address public token1;
    address public token2;
    mapping(address => uint256) public reserve;

    constructor() {
        owner = msg.sender;
    }

    function setTokens(address _token1, address _token2) public {
        require(msg.sender == owner);
        require(token1 == address(0));
        token1 = _token1;
        token2 = _token2;
    }

    function addLiquidity(address token_address, uint256 amount) public {
        require(msg.sender == owner);
        require(token_address == token1 || token_address == token2);
        reserve[token_address] += amount;
        require(IERC20(token_address).transferFrom(msg.sender, address(this), amount));
    }

    function swap(address from, address to, uint256 amount) public {
        require((from == token1 && to == token2) || (from == token2 && to == token1), "Invalid tokens");
        uint256 out = getSwapPrice(from, to, amount);
        reserve[from] += amount;
        reserve[to] -= out;
        require(IERC20(from).transferFrom(msg.sender, address(this), amount));
        require(IERC20(to).transfer(msg.sender, out));
    }

    function getSwapPrice(address from, address to, uint256 amount) public view returns (uint256) {
        uint256 rin = reserve[from];
        uint256 rout = reserve[to];
        return amount * rout / (rin + amount);
    }
}
