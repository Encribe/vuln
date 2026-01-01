pragma solidity 0.4.24;

contract Board {
    address public owner;
    uint256[] public cells;
    constructor() public { owner = msg.sender; }
    function resize(uint256 n) public { require(n <= 1024); cells.length = n; }
    function paint(uint256 i, uint256 c) public { require(i < cells.length); cells[i] = c; }
    function withdraw() public { require(msg.sender == owner); owner.transfer(address(this).balance); }
    function () public payable {}
}
