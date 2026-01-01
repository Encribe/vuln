// The metamorphic class's refusal fixture for a salted child that itself
// deploys a salted grandchild (docs/classes/metamorphic.md): the child's law
// walks the child's code, not the grandchild's, and the grandchild sits at a
// CREATE2 address the child published. The scan refuses the shape by name
// rather than assume the grandchild clean. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaGrandChild {
    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}

contract MetaNestChild {
    address public grand;

    constructor() {
        grand = address(new MetaGrandChild{salt: bytes32(0)}());
    }
}

contract MetaNestedInit {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaNestChild c = new MetaNestChild{salt: salt}();
        last = address(c);
        return last;
    }
}
