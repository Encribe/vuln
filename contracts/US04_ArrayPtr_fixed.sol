pragma solidity 0.4.24;

contract Lister {
    address public owner;
    uint256[] public items;
    constructor() public { owner = msg.sender; }
    function addAll(uint256 x) public {
        uint256[] memory tmp = new uint256[](1);
        tmp[0] = x;
        items.push(tmp[0]);
    }
    function kill() public { require(msg.sender == owner); selfdestruct(owner); }
}
