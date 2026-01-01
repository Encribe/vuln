// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SAFE twin of SigReplay: the digest holds the recipient's nonce, which the
// call advances, so a second call needs a new signature.
contract SigNonce {
    address public signer;
    mapping(address => uint256) public credit;
    mapping(address => uint256) public nonces;

    constructor(address s) {
        signer = s;
    }

    function claim(address to, uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, address(this), to, amount, nonces[to]));
        address got = ecrecover(digest, v, r, s);
        require(got != address(0) && got == signer, "bad signature");
        nonces[to] += 1;
        credit[to] += amount;
    }
}
