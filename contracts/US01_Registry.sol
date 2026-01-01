pragma solidity 0.4.24;

contract Registry {
    address public owner;
    struct Entry { address who; uint256 amount; }
    mapping(uint256 => Entry) public entries;
    constructor() public { owner = msg.sender; }
    function register(uint256 id, uint256 amount) public {
        Entry e; // uninitialized: points at slot 0 (owner)
        e.who = msg.sender;
        e.amount = amount;
        entries[id] = e;
    }
    function withdraw() public { require(msg.sender == owner); msg.sender.transfer(address(this).balance); }
    function () public payable {}
}
