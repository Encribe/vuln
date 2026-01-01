// The metamorphic class's refusal fixture for a child whose constructor
// installs its own runtime from an internal helper rather than directly from
// its own constructor body (docs/classes/metamorphic.md): the check follows the
// constructor's calls, so the installed code is still not solc's artefact and
// the class REFUSES by name. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaIndChild {
    constructor() {
        _install();
    }

    function _install() private {
        assembly {
            mstore(0, 0xff)
            return(31, 1)
        }
    }
}

contract MetaIndirectInit {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaIndChild c = new MetaIndChild{salt: salt}();
        last = address(c);
        return last;
    }
}
