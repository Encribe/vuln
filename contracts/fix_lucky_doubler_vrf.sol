// Derived fix of SmartBugs curated bad_randomness/lucky_doubler.sol, reduced to
// the payout draw: the paid entry is chosen by a randomness coordinator
// callback, not from the previous block hash.
pragma solidity ^0.4.24;

contract LuckyDoublerVRF {
    struct Entry { address entryAddress; uint payout; bool paid; }

    address public coordinator;
    Entry[] public entries;
    uint public unpaidCount;

    constructor(address _coordinator) public {
        coordinator = _coordinator;
    }

    function join() public payable {
        require(msg.value >= 1 ether);
        entries.push(Entry(msg.sender, msg.value * 2 * 95 / 100, false));
        unpaidCount += 1;
    }

    function fulfillRandomness(uint randomness) public {
        require(msg.sender == coordinator);
        require(entries.length > 0);
        Entry storage e = entries[randomness % entries.length];
        if (!e.paid && address(this).balance >= e.payout) {
            e.paid = true;
            unpaidCount -= 1;
            e.entryAddress.transfer(e.payout);
        }
    }
}
