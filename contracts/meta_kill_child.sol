// The metamorphic class's buggy twin for a child WITH a salt that holds
// SELFDESTRUCT (docs/classes/metamorphic.md): the child's runtime code reaches
// SELFDESTRUCT, so the child's law (MT.child.0.safe) is stated and bend finds no
// proof of it. The section reads NOT PROVEN naming the reachable SELFDESTRUCT,
// and is NEVER FOUND: no EVM replay has shown a redeploy replacing the code and
// moving a victim's funds yet. Whoever deploys this child at the CREATE2
// address first can, after it is killed, deploy different code there.
pragma solidity ^0.8.20;

contract MetaKillee {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
    }

    function set(uint256 v) external {
        value = v;
    }

    function kill() external {
        require(msg.sender == owner, "not owner");
        selfdestruct(payable(owner));
    }
}

contract MetaKillChild {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaKillee k = new MetaKillee{salt: salt}();
        last = address(k);
        return last;
    }
}
