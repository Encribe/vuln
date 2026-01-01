// The metamorphic class's actual metamorphic shape (docs/classes/
// metamorphic.md): a factory deploys a child with a salt, and the child's
// constructor returns a runtime it generates itself with inline assembly
// (`return`), so the same init code and the same salt can install different
// code on a second deployment. solc's runtime artefact for MetaCustom is not
// the code the constructor installs, so the class cannot read the installed
// code from that artefact and REFUSES by name (the constructor uses inline
// assembly). It is NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaCustom {
    constructor() {
        assembly {
            mstore(0, 0xff)
            return(31, 1)
        }
    }
}

contract MetaCustomInit {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaCustom c = new MetaCustom{salt: salt}();
        last = address(c);
        return last;
    }
}
