// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), pattern of the 2022 LI.FI and 2024 Socket arbitrary call incidents
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Bridge {
    event Bridged(address token, uint256 amount, uint256 chain);
    function bridgeWithCall(IERC20 token, uint256 amount, uint256 chain, address callTarget, bytes calldata callData) external {
        if (callTarget != address(0)) {
            (bool ok, ) = callTarget.call(callData);
            require(ok);
        }
        require(token.transferFrom(msg.sender, address(this), amount));
        emit Bridged(address(token), amount, chain);
    }
}
