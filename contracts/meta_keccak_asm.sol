// The metamorphic class's refusal fixture for keccak256 in inline assembly
// (docs/classes/metamorphic.md): the address may be computed from a salt the
// analysis cannot read, so the section REFUSES by name. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaKeccakAsm {
    function addr(bytes32 salt) external pure returns (address a) {
        assembly {
            mstore(0, salt)
            a := keccak256(0, 32)
        }
    }
}
