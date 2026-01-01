pragma solidity 0.4.24;

contract Base {
    address public treasury;
    constructor(address t) public { treasury = t; }
}
contract Vault is Base {
    address public treasury; // shadow, zero
    constructor(address t) Base(t) public {}
    function sweep() public { require(treasury != address(this)); msg.sender.transfer(address(this).balance); }
    function () public payable {}
}
