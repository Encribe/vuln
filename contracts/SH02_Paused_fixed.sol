pragma solidity 0.4.24;

contract Pausable {
    bool public paused;
    address public admin;
    constructor() public { admin = msg.sender; }
    function pause() public { require(msg.sender == admin); paused = true; }
    modifier whenNotPaused() { require(!paused); _; }
}
contract Token is Pausable {
    mapping(address => uint256) public bal;
    constructor() public { bal[msg.sender] = 1000; }
    function transfer(address to, uint256 v) public whenNotPaused {
        require(bal[msg.sender] >= v);
        bal[msg.sender] -= v; bal[to] += v;
    }
}
