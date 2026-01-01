pragma solidity 0.4.24;

contract Ledger {
    address public auditor;
    uint256[] public entries;
    constructor() public { auditor = msg.sender; }
    function record(uint256 idx, uint256 v) public {
        require(idx <= entries.length && idx < 1000000);
        if (idx == entries.length) entries.push(v); else entries[idx] = v;
    }
    function payout() public { require(msg.sender == auditor); auditor.transfer(address(this).balance); }
    function () public payable {}
}
