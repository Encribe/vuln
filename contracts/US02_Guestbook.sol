pragma solidity 0.4.24;

contract Guestbook {
    bool public locked = true;
    address public admin;
    struct Note { uint256 a; uint256 b; }
    Note[] public notes;
    constructor() public { admin = msg.sender; }
    function sign(uint256 a, uint256 b) public {
        Note n; // overwrites locked and admin
        n.a = a;
        n.b = b;
        notes.push(n);
    }
    function sweep() public { require(!locked || msg.sender == admin); msg.sender.transfer(address(this).balance); }
    function () public payable {}
}
