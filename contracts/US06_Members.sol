pragma solidity 0.4.24;

contract Members {
    address public admin;
    uint256 public fee = 1 ether;
    struct Member { address addr; uint256 paid; }
    mapping(address => Member) public members;
    constructor() public { admin = msg.sender; }
    function join() public payable {
        require(msg.value >= fee);
        Member m; // m.addr overwrites admin
        m.addr = msg.sender;
        m.paid = msg.value;
        members[msg.sender] = m;
    }
    function collect() public { require(msg.sender == admin); admin.transfer(address(this).balance); }
}
