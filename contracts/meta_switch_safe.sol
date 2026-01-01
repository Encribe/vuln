// The safe control for the metamorphic shape (docs/classes/metamorphic.md):
// the same factory and a child deployed with a salt, exposing deposit() and
// withdraw(), but the child's code cannot be removed. There is no
// SELFDESTRUCT, DELEGATECALL or CALLCODE, the constructor installs exactly the
// runtime solc compiled, and the same init code and salt therefore always
// install the same code at the same address. No redeploy is possible, so a
// second deployment at the salt reverts and the address keeps holding the
// victim's money.
//
// Run through the class this reads PROVEN, never FOUND: the law walks the
// deployed code and the salted child, and the witness never runs for a proven
// section. It is the control the class's own witness attack is measured
// against.
// pinned to 0.8.20 to match its buggy pair, so the two compile at one EVM
// target and the class's row metadata names the compiler it used
pragma solidity 0.8.20;

contract MetaSwitchSafeChild {
    mapping(address => uint256) public balanceOf;

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 v = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        (bool ok, ) = payable(msg.sender).call{value: v}("");
        require(ok, "send failed");
    }
}

contract MetaSwitchSafe {
    uint256 public phase;

    function deploy(bytes32 salt) external returns (address) {
        phase += 1;
        MetaSwitchSafeChild c = new MetaSwitchSafeChild{salt: salt}();
        return address(c);
    }
}
