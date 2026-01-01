// The metamorphic class's refusal fixture for a salted child whose constructor
// delegatecalls a target the analysis does not read (docs/classes/
// metamorphic.md): the delegated code runs in the init-code frame, so its
// RETURN can install a runtime the compiler did not write. solc's runtime
// artefact is then not the code deployed, and the class REFUSES by name.
// NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaDelegChild {
    constructor(address t) {
        (bool ok, ) = t.delegatecall("");
        ok;
    }
}

contract MetaDelegInit {
    address public last;

    function deploy(bytes32 salt, address t) external returns (address) {
        MetaDelegChild c = new MetaDelegChild{salt: salt}(t);
        last = address(c);
        return last;
    }
}
