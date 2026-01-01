// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// BUGGY twin of SigPay (domain): the digest leaves out this contract's
// address, so a signature given for one deployment pays on another
// deployment with the same signer. FOUND by src/sig/witness.ts, mode
// contract.
contract SigPayNoSelf {
    address public signer;
    mapping(address => uint256) public nonces;

    constructor(address s) payable {
        signer = s;
    }

    function claim(address payable to, uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, to, amount, nonces[to]));
        address got = ecrecover(digest, v, r, s);
        require(got != address(0) && got == signer, "bad signature");
        nonces[to] += 1;
        (bool ok, ) = to.call{value: amount}("");
        require(ok, "send");
    }
}
