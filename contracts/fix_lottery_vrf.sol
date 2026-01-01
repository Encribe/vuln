// Derived fix of SmartBugs curated bad_randomness/lottery.sol: the win flag
// comes from a randomness coordinator callback, not from block.number.
pragma solidity ^0.4.24;

contract LotteryVRF {
    struct Bet { uint betAmount; bool settled; bool won; address player; }

    address public organizer;
    address public coordinator;
    Bet[] public bets;

    constructor(address _coordinator) public {
        organizer = msg.sender;
        coordinator = _coordinator;
    }

    function makeBet() public payable returns (uint id) {
        id = bets.length;
        bets.push(Bet(msg.value, false, false, msg.sender));
    }

    function fulfillRandomness(uint id, uint randomness) public {
        require(msg.sender == coordinator);
        Bet storage b = bets[id];
        require(!b.settled);
        b.settled = true;
        b.won = randomness % 2 == 0;
        if (b.won) {
            b.player.transfer(b.betAmount);
        }
    }
}
