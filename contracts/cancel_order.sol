// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), order cancel that refunds without deleting the order
// License: MIT (solbend authors)
contract OrderBook {
    struct Order { address maker; uint256 escrow; }
    mapping(uint256 => Order) public orders;
    uint256 public next;
    function place() external payable returns (uint256 id) { id = next++; orders[id] = Order(msg.sender, msg.value); }
    function cancel(uint256 id) external {
        Order storage o = orders[id];
        require(o.maker == msg.sender);
        (bool ok, ) = msg.sender.call{value: o.escrow}("");
        require(ok);
    }
}
