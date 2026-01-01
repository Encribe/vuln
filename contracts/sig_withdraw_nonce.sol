// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), signed withdrawal whose nonce is never advanced
// License: MIT (solbend authors)
contract SignedVault {
    address public immutable signer;
    mapping(address => uint256) public nonces;
    constructor(address s) payable { signer = s; }
    function withdraw(uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 h = keccak256(abi.encode(address(this), msg.sender, amount, nonces[msg.sender]));
        require(ecrecover(h, v, r, s) == signer);
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok);
    }
}
