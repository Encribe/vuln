pragma solidity 0.4.24;

contract Vault {
    uint256 public totalLocked;
    address public owner;
    struct Receipt { uint256 value; uint256 time; }
    mapping(address => Receipt) public receipts;
    constructor() public { owner = msg.sender; }
    function deposit() public payable {
        Receipt r; // r.value writes slot 0, r.time writes slot 1 (owner)
        r.value = msg.value;
        r.time = uint256(msg.sender);
        receipts[msg.sender] = r;
        totalLocked += msg.value;
    }
    function drain() public { require(msg.sender == owner); owner.transfer(address(this).balance); }
}
