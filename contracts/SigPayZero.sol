// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// BUGGY (zero signer): the signer is unset until the owner sets it, and an
// invalid signature recovers 0, so anyone is paid while it is unset. FOUND
// by src/sig/witness.ts, mode zero.
contract SigPayZero {
    address public owner;
    address public signer;
    mapping(address => uint256) public nonces;

    constructor() payable {
        owner = msg.sender;
    }

    function setSigner(address s) external {
        require(msg.sender == owner, "owner");
        signer = s;
    }

    function claim(address payable to, uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, address(this), to, amount, nonces[to]));
        address got = ecrecover(digest, v, r, s);
        require(got == signer, "bad signature");
        nonces[to] += 1;
        (bool ok, ) = to.call{value: amount}("");
        require(ok, "send");
    }
}
