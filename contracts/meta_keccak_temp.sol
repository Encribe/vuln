// The metamorphic class's refusal fixture for a keccak256 address split into a
// temporary before the cast (docs/classes/metamorphic.md): the scan follows the
// temporary to the keccak256 and refuses by name. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaKeccakTemp {
    function addr(bytes32 salt) external pure returns (address) {
        bytes32 h = keccak256(abi.encodePacked(salt));
        return address(uint160(uint256(h)));
    }
}
