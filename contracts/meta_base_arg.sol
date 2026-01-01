// The metamorphic class's buggy twin for a salted SELFDESTRUCT child created in
// a base-constructor argument (docs/classes/metamorphic.md): the scan reads the
// whole ContractDefinition, not only function bodies, so the child's law is
// stated and NOT PROVEN naming the reachable SELFDESTRUCT. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaBaseChild {
    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}

contract MetaBasePlain {}

contract MetaBase {
    address public child;

    constructor(address c) {
        child = c;
    }
}

contract MetaBaseArg is MetaBase(address(new MetaBaseChild{salt: bytes32(uint256(2))}())) {
    MetaBasePlain public plain;

    function make() external {
        plain = new MetaBasePlain();
    }
}
