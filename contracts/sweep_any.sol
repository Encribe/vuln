// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pattern of the Ethernaut DoubleEntryPoint sweep
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Strategy {
    IERC20 public immutable want;
    mapping(address => uint256) public deposits;
    constructor(IERC20 w) { want = w; }
    function deposit(uint256 a) external { require(want.transferFrom(msg.sender, address(this), a)); deposits[msg.sender] += a; }
    function withdraw(uint256 a) external { deposits[msg.sender] -= a; require(want.transfer(msg.sender, a)); }
    function sweep(IERC20 token) external {
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }
}
