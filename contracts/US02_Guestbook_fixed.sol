pragma solidity 0.4.24;

contract Guestbook {
    bool public locked = true;
    address public admin;
    struct Note { uint256 a; uint256 b; }
    Note[] public notes;
    constructor() public { admin = msg.sender; }
    function sign(uint256 a, uint256 b) public {
        notes.push(Note(a, b));
    }
    function sweep() public { require(!locked || msg.sender == admin); msg.sender.transfer(address(this).balance); }
    function () public payable {}
}
