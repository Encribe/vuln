// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), user chosen call target with stored allowance
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Executor {
    mapping(address => mapping(address => bool)) public operator;
    function setOperator(address op, bool on) external { operator[msg.sender][op] = on; }
    function run(IERC20 token, address from, address to, uint256 amount) external {
        require(token.transferFrom(from, to, amount));
    }
}
