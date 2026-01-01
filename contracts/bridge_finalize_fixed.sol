// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), bridge message replay (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract BridgeGateway {
    address public immutable relayer;
    mapping(bytes32 => bool) public finalized;
    constructor(address r) payable { relayer = r; }
    function finalizeWithdrawal(uint256 nonce, address to, uint256 amount) external {
        require(msg.sender == relayer);
        bytes32 id = keccak256(abi.encode(nonce, to, amount));
        require(!finalized[id], "done");
        finalized[id] = true;
        (bool ok, ) = to.call{value: amount}("");
        require(ok);
    }
}
