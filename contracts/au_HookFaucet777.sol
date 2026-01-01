// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Token callback reentrancy, ERC-777 (docs/classes/token-hooks.md). An
// ERC-777 style token with a one-shot faucet. Its move calls tokensToSend on
// the sender's implementer before the balances change and tokensReceived on
// the recipient's after, as ERC-777 does. ERC-777 finds the implementer
// through the ERC-1820 registry. Here a holder with code is its own
// implementer, so the hook is code the holder picks either way.

interface IERC777Sender {
    function tokensToSend(address operator, address from, address to, uint256 amount, bytes calldata userData, bytes calldata operatorData) external;
}

interface IERC777Recipient {
    function tokensReceived(address operator, address from, address to, uint256 amount, bytes calldata userData, bytes calldata operatorData) external;
}

abstract contract Token777 {
    mapping(address => uint256) public balanceOf;
    mapping(address => bool) public dripped;
    uint256 public totalSupply;
    uint256 public constant DRIP = 100;

    // ERC-777 calls tokensToSend before a move and tokensReceived after it.
    // Here a send calls the recipient's hook and a burn the holder's, one
    // hook per function: a function that calls out twice is the reentrancy
    // prover's named limit (docs/classes/token-hooks.md)
    function send(address to, uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        _received(msg.sender, to, amount);
    }

    // (the burn lowers the balance before the holder's hook, where ERC-777
    // calls tokensToSend first: the order a proof over the hook can read)
    function burn(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        if (msg.sender.code.length > 0) IERC777Sender(msg.sender).tokensToSend(msg.sender, msg.sender, address(0), amount, "", "");
    }

    function _mint(address to, uint256 amount) internal {
        totalSupply += amount;
        balanceOf[to] += amount;
        _received(address(0), to, amount);
    }

    function _received(address from, address to, uint256 amount) internal {
        if (to.code.length > 0) IERC777Recipient(to).tokensReceived(msg.sender, from, to, amount, "", "");
    }
}

// BUGGY: the drip is recorded after the mint's tokensReceived hook, so the
// recipient's implementer drips again from inside the hook.
contract HookFaucet777Buggy is Token777 {
    function drip() external {
        require(!dripped[msg.sender], "dripped");
        _mint(msg.sender, DRIP);
        dripped[msg.sender] = true;
    }
}

// SAFE: the drip is recorded before the hook.
contract HookFaucet777Safe is Token777 {
    function drip() external {
        require(!dripped[msg.sender], "dripped");
        dripped[msg.sender] = true;
        _mint(msg.sender, DRIP);
    }
}
