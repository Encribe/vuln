// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Escrow {
    address public buyer; address public seller; uint256 public price;
    constructor(address s, uint256 p) { buyer = msg.sender; seller = s; price = p; }
    function fund() external payable {}
    function release() external {
        require(msg.sender == buyer);
        require(address(this).balance == price, "wrong funding");
        payable(seller).transfer(price);
    }
}
