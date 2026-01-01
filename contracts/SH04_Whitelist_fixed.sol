pragma solidity 0.4.24;

contract Whitelist {
    mapping(address => bool) public allowed;
    address public admin = msg.sender;
    function allow(address a) public { require(msg.sender == admin); allowed[a] = true; }
}
contract Sale is Whitelist {
    mapping(address => uint256) public bought;
    function buy() public payable {
        require(allowed[msg.sender] && msg.value > 0);
        bought[msg.sender] += msg.value;
    }
}
