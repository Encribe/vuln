pragma solidity 0.4.24;

contract Base {
    address public treasury;
    constructor(address t) public { treasury = t; }
}
contract Vault is Base {
    constructor(address t) Base(t) public {}
    function sweep() public { require(msg.sender == treasury); msg.sender.transfer(address(this).balance); }
    function () public payable {}
}
