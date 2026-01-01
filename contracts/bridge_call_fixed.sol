// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pattern of the 2022 LI.FI and 2024 Socket arbitrary call incidents (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
interface IHook { function beforeBridge(address user, address token, uint256 amount) external; }
contract Bridge {
    event Bridged(address token, uint256 amount, uint256 chain);
    function bridgeWithCall(IERC20 token, uint256 amount, uint256 chain, address hook) external {
        require(token.transferFrom(msg.sender, address(this), amount));
        if (hook != address(0)) IHook(hook).beforeBridge(msg.sender, address(token), amount);
        emit Bridged(address(token), amount, chain);
    }
}
