pragma solidity 0.4.24;

contract Ledger {
    address public auditor;
    uint256[] public entries;
    constructor() public { auditor = msg.sender; }
    function record(uint256 idx, uint256 v) public {
        if (idx >= entries.length) entries.length = idx + 1; // idx = 2^256-1 wraps to length 0, idx unchecked
        entries[idx] = v;
    }
    function payout() public { require(msg.sender == auditor); auditor.transfer(address(this).balance); }
    function () public payable {}
}
