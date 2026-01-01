pragma solidity 0.4.24;

contract Ownable {
    address public owner;
    constructor() public { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner); _; }
}
contract Wallet is Ownable {
    function setOwner(address o) public onlyOwner { owner = o; }
    function withdraw() public {
        require(msg.sender == owner || owner == address(0));
        msg.sender.transfer(address(this).balance);
    }
    function () public payable {}
}
