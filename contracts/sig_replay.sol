// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), signature claim without replay protection (SWC-121 pattern)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract SignedDrop {
    IERC20 public immutable token;
    address public immutable signer;
    constructor(IERC20 t, address s) { token = t; signer = s; }
    function claim(uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 h = keccak256(abi.encodePacked(address(this), msg.sender, amount));
        require(ecrecover(h, v, r, s) == signer, "sig");
        require(token.transfer(msg.sender, amount));
    }
}
