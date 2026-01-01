// Derived fix of ConsenSys best-practices send_loop.sol (SmartBugs curated copy):
// each address withdraws its own refund, as the best-practices page recommends.
pragma solidity 0.4.24;

contract RefunderPull {
    mapping (address => uint) public refunds;

    function credit() public payable {
        refunds[msg.sender] += msg.value;
    }

    function withdrawRefund() public {
        uint amount = refunds[msg.sender];
        refunds[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}
