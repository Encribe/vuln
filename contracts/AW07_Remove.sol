pragma solidity 0.4.24;

contract Registry {
    address public owner;
    address[] public members;
    constructor() public { owner = msg.sender; }
    function add(address m) public { members.push(m); }
    function remove() public { members.length -= 1; } // unchecked decrement
    function edit(uint256 i, address m) public { require(i < members.length); members[i] = m; }
    function kill() public { require(msg.sender == owner); selfdestruct(owner); }
}
