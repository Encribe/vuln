// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SAFE twin of SigZeroSigner: the call rejects a zero recovered signer.
contract SigNonzero {
    address public owner;
    address public signer;
    mapping(address => uint256) public credit;
    mapping(address => uint256) public nonces;

    constructor() {
        owner = msg.sender;
    }

    function setSigner(address s) external {
        require(msg.sender == owner, "owner");
        signer = s;
    }

    function claim(address to, uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, address(this), to, amount, nonces[to]));
        address got = ecrecover(digest, v, r, s);
        require(got != address(0), "invalid signature");
        require(got == signer, "bad signature");
        nonces[to] += 1;
        credit[to] += amount;
    }
}
