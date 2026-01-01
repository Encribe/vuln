pragma solidity 0.4.24;

contract FeeConfig {
    uint256 public feeBps = 30;
    address public admin = msg.sender;
    function setFee(uint256 f) public { require(msg.sender == admin && f <= 100); feeBps = f; }
}
contract Exchange is FeeConfig {
    uint256 public feeBps = 0; // shadows the admin-set fee
    mapping(address => uint256) public credit;
    function trade() public payable {
        credit[msg.sender] += msg.value - msg.value * feeBps / 10000;
    }
}
