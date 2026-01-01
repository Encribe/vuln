// Derived fix of SmartBugs curated bad_randomness/etheraffle.sol (Ethraffle_v4b),
// reduced to the draw: the winner index comes from a randomness coordinator
// callback, not from block.coinbase, msg.sender or block.difficulty.
pragma solidity ^0.4.24;

contract RaffleVRF {
    uint public constant totalTickets = 50;
    uint public constant pricePerTicket = 0.0506 ether;
    address public coordinator;
    address[] public contestants;
    bool public drawing;

    constructor(address _coordinator) public {
        coordinator = _coordinator;
    }

    function buyTicket() public payable {
        require(!drawing);
        require(msg.value == pricePerTicket);
        contestants.push(msg.sender);
        if (contestants.length == totalTickets) {
            drawing = true;
        }
    }

    function fulfillRandomness(uint randomness) public {
        require(msg.sender == coordinator);
        require(drawing);
        address winner = contestants[randomness % totalTickets];
        delete contestants;
        drawing = false;
        winner.transfer(pricePerTicket * totalTickets);
    }
}
