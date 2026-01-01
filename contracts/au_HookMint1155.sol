// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Token callback reentrancy, ERC-1155 mint (docs/classes/token-hooks.md).
// _mint calls onERC1155Received on a receiver with code, as OpenZeppelin's
// ERC1155 does through _doSafeTransferAcceptanceCheck.

interface IERC1155Receiver {
    function onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes calldata data) external returns (bytes4);
}

abstract contract Mint1155 {
    mapping(uint256 => mapping(address => uint256)) public balances;
    mapping(address => bool) public claimed;
    uint256 public totalSupply;
    uint256 public constant ID = 1;
    uint256 public constant AMOUNT = 10;

    function balanceOf(address who) external view returns (uint256) { return balances[ID][who]; }

    function _mint(address to) internal {
        balances[ID][to] += AMOUNT;
        totalSupply += AMOUNT;
        if (to.code.length > 0) {
            require(IERC1155Receiver(to).onERC1155Received(msg.sender, address(0), ID, AMOUNT, "") == IERC1155Receiver.onERC1155Received.selector, "receiver");
        }
    }
}

// BUGGY: the claim flag is set after the mint's hook.
contract HookMint1155Buggy is Mint1155 {
    function claim() external {
        require(!claimed[msg.sender], "claimed");
        _mint(msg.sender);
        claimed[msg.sender] = true;
    }
}

// SAFE: the claim flag is final before the hook.
contract HookMint1155Safe is Mint1155 {
    function claim() external {
        require(!claimed[msg.sender], "claimed");
        claimed[msg.sender] = true;
        _mint(msg.sender);
    }
}
