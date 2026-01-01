pragma solidity 0.4.24;

contract Game {
    uint256 public secret;
    address public owner;
    struct Bet { uint256 number; address player; }
    Bet[] public bets;
    constructor(uint256 s) public { secret = s; owner = msg.sender; }
    function play(uint256 number) public payable {
        require(msg.value >= 0.1 ether);
        Bet b; // b.number overwrites secret
        b.number = number;
        b.player = msg.sender;
        bets.push(b);
        if (number == secret) msg.sender.transfer(address(this).balance);
    }
}
