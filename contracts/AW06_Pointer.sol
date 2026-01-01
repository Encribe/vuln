// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Admin {
    address public admin = msg.sender;
    struct Rec { uint256 v; }
    function setAt(uint256 slot, uint256 v) external {
        Rec storage r;
        assembly { r.slot := slot } // user-chosen storage pointer
        r.v = v;
    }
    function take() external { require(msg.sender == admin); payable(admin).transfer(address(this).balance); }
    receive() external payable {}
}
