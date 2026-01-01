// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Admin {
    address public admin = msg.sender;
    struct Rec { uint256 v; }
    mapping(address => Rec) internal recs;
    function setAt(uint256, uint256 v) external {
        Rec storage r = recs[msg.sender];
        r.v = v;
    }
    function take() external { require(msg.sender == admin); payable(admin).transfer(address(this).balance); }
    receive() external payable {}
}
