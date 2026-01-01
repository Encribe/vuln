// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pattern of Web3Bugs Marginswap H-02 (missing fromToken != toToken) (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract InternalAmm {
    mapping(uint256 => uint256) public reserve;
    mapping(address => mapping(uint256 => uint256)) public bal;
    function deposit(uint256 t) external payable { require(t < 2); bal[msg.sender][t] += msg.value; reserve[t] += msg.value; }
    function swap(uint256 a, uint256 b, uint256 amt) external {
        require(a < 2 && b < 2 && a != b);
        uint256 ra = reserve[a];
        uint256 rb = reserve[b];
        uint256 out = amt * rb / (ra + amt);
        bal[msg.sender][a] -= amt;
        bal[msg.sender][b] += out;
        reserve[a] = ra + amt;
        reserve[b] = rb - out;
    }
    function withdraw(uint256 t, uint256 amt) external {
        bal[msg.sender][t] -= amt;
        reserve[t] -= amt;
        (bool ok, ) = msg.sender.call{value: amt}("");
        require(ok);
    }
}
