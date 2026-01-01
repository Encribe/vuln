pragma solidity 0.4.24;

contract Limits {
    uint256 public maxWithdraw = 1 ether;
}
contract Bank is Limits {
    mapping(address => uint256) public bal;
    function deposit() public payable { bal[msg.sender] += msg.value; }
    function withdraw(uint256 a) public {
        require(a <= maxWithdraw && a <= bal[msg.sender]);
        bal[msg.sender] -= a;
        msg.sender.transfer(a);
    }
}
