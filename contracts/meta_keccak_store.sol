// The metamorphic class's keccak-address shape through storage
// (docs/classes/metamorphic.md): the hash is written into a struct field and
// the address cast reads it back, so the value never sits in a temporary. The
// scan taints the base of a field assignment, so the cast is seen and the
// contract is REFUSED by name. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaKsPlain {}

contract MetaKeccakStore {
    struct Rec {
        bytes32 h;
    }

    Rec public rec;
    address public expected;
    MetaKsPlain public plain;

    function make() external {
        plain = new MetaKsPlain();
    }

    function set(bytes32 salt) external {
        rec.h = keccak256(abi.encodePacked(hex"ff", address(this), salt));
    }

    function pay() external payable {
        require(msg.sender == address(uint160(uint256(rec.h))), "not the precomputed deployer");
    }
}
