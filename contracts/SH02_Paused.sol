pragma solidity 0.4.24;

contract Pausable {
    bool public paused;
    address public admin;
    constructor() public { admin = msg.sender; }
    function pause() public { require(msg.sender == admin); paused = true; }
    modifier whenNotPaused() { require(!paused); _; }
}
contract Token is Pausable {
    bool public paused; // shadows: pause() sets the base copy, transfer reads this one
    mapping(address => uint256) public bal;
    constructor() public { bal[msg.sender] = 1000; }
    function transfer(address to, uint256 v) public {
        require(!paused);
        require(bal[msg.sender] >= v);
        bal[msg.sender] -= v; bal[to] += v;
    }
}
