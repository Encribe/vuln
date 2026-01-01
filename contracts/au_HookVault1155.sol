// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Token callback reentrancy, ERC-1155 (docs/classes/token-hooks.md).
// The vault pays ETH-backed credit out as an ERC-1155 transfer that calls
// onERC1155Received on the receiver. A withdrawal pays ETH and hands the
// receipt through the hook. The ETH goes by `transfer`, whose 2300 gas
// stipend runs no callback that can write state, so the hook is the only
// call that can re-enter.

interface IERC1155Receiver {
    function onERC1155Received(address operator, address from, uint256 id, uint256 value, bytes calldata data) external returns (bytes4);
    function onERC1155BatchReceived(address operator, address from, uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external returns (bytes4);
}

abstract contract Vault1155 {
    mapping(address => uint256) public deposits;
    mapping(uint256 => mapping(address => uint256)) public receipts;

    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    function _hook(address to, uint256 amount) internal {
        receipts[0][to] += amount;
        if (to.code.length > 0) {
            require(IERC1155Receiver(to).onERC1155Received(msg.sender, address(this), 0, amount, "") == IERC1155Receiver.onERC1155Received.selector, "receiver");
        }
    }

    function _batchHook(address to, uint256 amount) internal {
        uint256[] memory ids = new uint256[](1);
        uint256[] memory vals = new uint256[](1);
        vals[0] = amount;
        receipts[0][to] += amount;
        if (to.code.length > 0) {
            require(IERC1155Receiver(to).onERC1155BatchReceived(msg.sender, address(this), ids, vals, "") == IERC1155Receiver.onERC1155BatchReceived.selector, "receiver");
        }
    }
}

// BUGGY: the receipt hook runs before the deposit is cleared, so the receiver
// withdraws again from inside onERC1155Received.
contract HookVault1155Buggy is Vault1155 {
    function withdraw() external {
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "none");
        _hook(msg.sender, amount);
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}

// BUGGY: the batch hook, the same order.
contract HookVault1155BatchBuggy is Vault1155 {
    function withdraw() external {
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "none");
        _batchHook(msg.sender, amount);
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}

// SAFE: the deposit is cleared before the hook and before the payment.
contract HookVault1155Safe is Vault1155 {
    function withdraw() external {
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "none");
        deposits[msg.sender] = 0;
        _hook(msg.sender, amount);
        payable(msg.sender).transfer(amount);
    }
}
