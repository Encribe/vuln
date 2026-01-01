// The metamorphic class's refusal fixture for an address computed from a
// caller-supplied salt (docs/classes/metamorphic.md): the contract precomputes a
// CREATE2 address from a salt the caller supplies, so whoever can deploy at that
// address first takes it. The analysis cannot read who can get there, so the
// section REFUSES and the reason says the salt comes from a caller.
pragma solidity ^0.8.20;

contract MetaCallerSalt {
    function addrFromSalt(bytes32 salt) external pure returns (address) {
        return address(uint160(uint256(keccak256(abi.encodePacked(salt)))));
    }

    function addrFromSaltAndCode(bytes32 salt, bytes32 codehash) external view returns (address) {
        return address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, codehash)))));
    }
}
