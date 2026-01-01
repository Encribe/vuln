// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), unprotected generic execute (fixed version written for this benchmark)
// License: MIT (solbend authors)
contract Wallet {
    address public owner;
    constructor() { owner = msg.sender; }
    receive() external payable {}
    function execute(address target, uint256 value, bytes calldata data) external returns (bytes memory) {
        require(msg.sender == owner, "owner");
        (bool ok, bytes memory ret) = target.call{value: value}(data);
        require(ok);
        return ret;
    }
}
