// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Token callback reentrancy, ERC-721 (docs/classes/token-hooks.md).
// _safeMint calls onERC721Received on a receiver with code, the same hook
// OpenZeppelin's ERC721 makes. The receiver is the caller, so it can re-enter.

interface IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
}

abstract contract Mint721 {
    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;
    mapping(address => bool) public claimed;
    uint256 public nextId;
    uint256 public constant MAX_SUPPLY = 1000;

    function totalSupply() external view returns (uint256) { return nextId; }

    function _mint(address to) internal returns (uint256 id) {
        id = nextId;
        nextId = id + 1;
        ownerOf[id] = to;
        balanceOf[to] += 1;
    }

    function _safeMint(address to) internal {
        uint256 id = _mint(to);
        if (to.code.length > 0) {
            require(IERC721Receiver(to).onERC721Received(msg.sender, address(0), id, "") == IERC721Receiver.onERC721Received.selector, "receiver");
        }
    }
}

// BUGGY: the claim flag is set after the hook, so the receiver claims again
// from inside onERC721Received and mints more than one token.
contract HookMint721Buggy is Mint721 {
    function claim() external {
        require(!claimed[msg.sender], "claimed");
        require(nextId < MAX_SUPPLY, "sold out");
        _safeMint(msg.sender);
        claimed[msg.sender] = true;
    }
}

// SAFE: the flag is final before the hook (checks-effects-interactions over
// the hook call).
contract HookMint721Safe is Mint721 {
    function claim() external {
        require(!claimed[msg.sender], "claimed");
        require(nextId < MAX_SUPPLY, "sold out");
        claimed[msg.sender] = true;
        _safeMint(msg.sender);
    }
}

// SAFE: a lock the hook cannot clear.
contract HookMint721Guarded is Mint721 {
    bool private locked;
    function claim() external {
        require(!locked, "locked");
        locked = true;
        require(!claimed[msg.sender], "claimed");
        require(nextId < MAX_SUPPLY, "sold out");
        _safeMint(msg.sender);
        claimed[msg.sender] = true;
        locked = false;
    }
}
