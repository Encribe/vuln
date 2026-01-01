pragma solidity 0.4.24;

contract Escrow {
    address public arbiter;
    uint256 public count;
    struct Deal { address buyer; uint256 amount; }
    mapping(uint256 => Deal) public deals;
    constructor() public { arbiter = msg.sender; }
    function open() public payable {
        Deal d; // d.buyer overwrites arbiter
        d.buyer = msg.sender;
        d.amount = msg.value;
        deals[count++] = d;
    }
    function release(uint256 id, address to) public {
        require(msg.sender == arbiter);
        uint256 a = deals[id].amount; deals[id].amount = 0; to.transfer(a);
    }
}
