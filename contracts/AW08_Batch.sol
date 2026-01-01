pragma solidity 0.4.24;

contract Batch {
    address public owner;
    bytes32[] public data;
    constructor() public { owner = msg.sender; }
    function setLen(uint256 n) public { data.length = n; }
    function write(uint256 i, bytes32 d) public { require(i < data.length); data[i] = d; }
    function sweep() public { require(msg.sender == owner); owner.transfer(address(this).balance); }
    function () public payable {}
}
