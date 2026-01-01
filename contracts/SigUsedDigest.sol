// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// SAFE twin of SigReplay: the digest is marked used, so neither the same
// signature nor its malleable twin (n - s, v ^ 1) passes a second time.
contract SigUsedDigest {
    address public signer;
    mapping(address => uint256) public credit;
    mapping(bytes32 => bool) public used;

    constructor(address s) {
        signer = s;
    }

    function claim(address to, uint256 amount, uint256 salt, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, address(this), to, amount, salt));
        require(!used[digest], "used");
        address got = ecrecover(digest, v, r, s);
        require(got != address(0) && got == signer, "bad signature");
        used[digest] = true;
        credit[to] += amount;
    }
}
