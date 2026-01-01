// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), fee computed with rounding that underflows the protocol cut (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract FeeRouter {
    IERC20 public immutable token;
    address public immutable treasury;
    constructor(IERC20 t, address tr) { token = t; treasury = tr; }
    function send(address to, uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount));
        uint256 fee = amount * 30 / 10000;
        uint256 net = amount - fee;
        require(token.transfer(to, net));
        require(token.transfer(treasury, fee));
    }
}
