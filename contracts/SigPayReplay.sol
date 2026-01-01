// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// BUGGY twin of SigPay (single use): no nonce, so the attacker the signer
// paid once sends the same signature again and is paid from the treasury
// again. FOUND by src/sig/witness.ts, mode reuse.
contract SigPayReplay {
    address public signer;

    constructor(address s) payable {
        signer = s;
    }

    function claim(address payable to, uint256 amount, uint8 v, bytes32 r, bytes32 s) external {
        bytes32 digest = keccak256(abi.encode(block.chainid, address(this), to, amount));
        address got = ecrecover(digest, v, r, s);
        require(got != address(0) && got == signer, "bad signature");
        (bool ok, ) = to.call{value: amount}("");
        require(ok, "send");
    }
}
