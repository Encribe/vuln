// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), lock cleared on a memory copy
// License: MIT (solbend authors)
contract Locker {
    struct Lock { uint256 amount; uint256 until; }
    mapping(address => Lock) public locks;
    function lock(uint256 secs) external payable { require(locks[msg.sender].amount == 0); locks[msg.sender] = Lock(msg.value, block.timestamp + secs); }
    function withdraw() external {
        Lock memory l = locks[msg.sender];
        require(l.amount > 0 && block.timestamp >= l.until);
        l.amount = 0;
        (bool ok, ) = msg.sender.call{value: locks[msg.sender].amount}("");
        require(ok);
    }
}
