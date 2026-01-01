// The metamorphic class's refusal fixture for inline assembly that runs
// create2 (docs/classes/metamorphic.md): the init code or salt cannot be named,
// so the child whose code it deploys is not read and the section REFUSES by
// name. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaAsmCreate2 {
    function deploy(bytes32 salt, bytes calldata code) external returns (address a) {
        assembly {
            a := create2(0, code.offset, code.length, salt)
        }
    }
}
