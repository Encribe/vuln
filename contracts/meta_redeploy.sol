// The metamorphic redeploy shape (docs/classes/metamorphic.md): a factory
// deploys a wallet with a salt, the wallet's owner can selfdestruct it, and
// anyone can then redeploy the same code at the same CREATE2 address. A user
// who funded the old wallet address now talks to a fresh instance. This is the
// buggy row the class's EVM witness replays (selfdestruct, redeploy, a
// victim's loss, against a control with no redeploy) on Shanghai, before
// EIP-6780 made a selfdestruct clear code only in the creating transaction.
// Until that witness runs the child's law is stated and NOT PROVEN naming the
// reachable SELFDESTRUCT, never FOUND.
//
// The factory passes tx.origin as the wallet owner, a common pattern: it is
// what lets the attacker own the first and the redeployed instance, so the
// witness can show the attacker moving a victim's funds out of the address the
// victim was told to use.
pragma solidity ^0.8.20;

contract MetaWallet {
    address public owner;
    mapping(address => uint256) public balanceOf;

    constructor() {
        owner = tx.origin;
    }

    function deposit() external payable {
        balanceOf[msg.sender] += msg.value;
    }

    function kill() external {
        require(msg.sender == owner, "not owner");
        selfdestruct(payable(owner));
    }
}

contract MetaFactory {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        MetaWallet w = new MetaWallet{salt: salt}();
        last = address(w);
        return last;
    }
}
