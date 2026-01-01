// The metamorphic class's safe fixture for a child deployed WITHOUT a salt
// (docs/classes/metamorphic.md): the child's address is the deterministic
// CREATE address, so no one else can redeploy code there and the class states
// no law over the child. The parent's own law still applies and is clean, so
// PROVEN, with the child named on the section as deterministic (not covered by
// this class).
pragma solidity ^0.8.20;

contract MetaChildPlain {
    uint256 public value;

    function set(uint256 v) external {
        value = v;
    }
}

contract MetaNoSalt {
    address public last;

    function deploy() external returns (address) {
        MetaChildPlain c = new MetaChildPlain();
        last = address(c);
        return last;
    }
}
