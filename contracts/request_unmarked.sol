// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), withdrawal request not marked as processed
// License: MIT (solbend authors)
contract WithdrawQueue {
    struct Req { address owner; uint256 amount; uint256 readyAt; bool done; }
    Req[] public reqs;
    mapping(address => uint256) public balanceOf;
    function deposit() external payable { balanceOf[msg.sender] += msg.value; }
    function request(uint256 a) external returns (uint256) {
        balanceOf[msg.sender] -= a;
        reqs.push(Req(msg.sender, a, block.timestamp + 1 days, false));
        return reqs.length - 1;
    }
    function claim(uint256 id) external {
        Req storage r = reqs[id];
        require(r.owner == msg.sender && !r.done && block.timestamp >= r.readyAt);
        (bool ok, ) = msg.sender.call{value: r.amount}("");
        require(ok);
    }
}
