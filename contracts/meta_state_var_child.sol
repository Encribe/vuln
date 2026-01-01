// The metamorphic class's buggy twin for a salted SELFDESTRUCT child created in
// a state-variable initializer (docs/classes/metamorphic.md): the scan reads
// the whole source, not only function bodies, so the child's law is stated and
// NOT PROVEN naming the reachable SELFDESTRUCT. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaSvChild {
    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}

contract MetaStateVarChild {
    address public child = address(new MetaSvChild{salt: bytes32(0)}());
}
