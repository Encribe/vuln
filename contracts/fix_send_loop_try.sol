// Derived fix of ConsenSys best-practices send_loop.sol (SmartBugs curated copy):
// a bounded batch where a failed send is recorded for a later pull instead of
// reverting the whole batch.
pragma solidity 0.4.24;

contract RefunderBatch {
    address[] private refundAddresses;
    mapping (address => uint) public refunds;
    uint public next;

    function register() public payable {
        refundAddresses.push(msg.sender);
        refunds[msg.sender] += msg.value;
    }

    function refundBatch(uint maxCount) public {
        require(maxCount <= 50);
        uint end = next + maxCount;
        if (end > refundAddresses.length) end = refundAddresses.length;
        for (uint x = next; x < end; x++) {
            address who = refundAddresses[x];
            uint amount = refunds[who];
            refunds[who] = 0;
            if (!who.send(amount)) {
                refunds[who] = amount;
            }
        }
        next = end;
    }

    function withdrawRefund() public {
        uint amount = refunds[msg.sender];
        refunds[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}
