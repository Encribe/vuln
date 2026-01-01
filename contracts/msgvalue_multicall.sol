// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), msg.value reused across delegatecall multicall entries
// License: MIT (solbend authors)
contract Seller {
    mapping(address => uint256) public credits;
    uint256 public constant PRICE = 1 ether;
    function buy() public payable { require(msg.value >= PRICE); credits[msg.sender] += 1; }
    function sell() external {
        credits[msg.sender] -= 1;
        (bool ok, ) = msg.sender.call{value: PRICE}("");
        require(ok);
    }
    function multicall(bytes[] calldata calls) external payable {
        for (uint256 i = 0; i < calls.length; i++) {
            (bool ok, ) = address(this).delegatecall(calls[i]);
            require(ok);
        }
    }
}
