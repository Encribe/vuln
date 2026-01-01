// The metamorphic redeploy class's safe fixture (docs/classes/metamorphic.md,
// src/metamorphic_law.ts): the parent deploys a child with a salt, and neither
// the parent's own runtime code nor the child's reaches SELFDESTRUCT,
// DELEGATECALL or CALLCODE, so PROVEN with the law MT.parent.safe and
// MT.child.0.safe named in report.json. A caller-supplied salt is safe here
// because the init code is fixed by `new MetaChildSafe` and the child's code is
// clean: the worst a squatter can put at the CREATE2 address is the same code.
pragma solidity ^0.8.20;

contract MetaChildSafe {
    uint256 public value;

    function set(uint256 v) external {
        value = v;
    }
}

contract MetaSafe {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaChildSafe c = new MetaChildSafe{salt: salt}();
        last = address(c);
        return last;
    }
}
