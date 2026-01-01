pragma solidity 0.4.24;

contract Lister {
    address public owner;
    uint256[] public items;
    constructor() public { owner = msg.sender; }
    function addAll(uint256 x) public {
        uint256[] tmp; // uninitialized storage array aliases slot 0 (owner)
        tmp.push(x);
        items.push(x);
    }
    function kill() public { require(msg.sender == owner); selfdestruct(owner); }
}
