pragma solidity 0.4.24;

contract Queue {
    address public owner;
    uint256[] public q;
    constructor() public { owner = msg.sender; }
    function push(uint256 v) public { q.push(v); }
    function pop() public { require(q.length > 0); q.length--; }
    function set(uint256 i, uint256 v) public { require(i < q.length); q[i] = v; }
    function kill() public { require(msg.sender == owner); selfdestruct(owner); }
}
