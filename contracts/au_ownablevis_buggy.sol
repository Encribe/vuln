// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: ownership setter declared public.
pragma solidity ^0.8.20;
contract OwnableVisBuggy {
    address public owner;
    constructor() { _setOwner(msg.sender); }
    function _setOwner(address o) public { owner = o; }
    function transferOwnership(address o) external { require(msg.sender == owner, "not owner"); _setOwner(o); }
    receive() external payable {}
    function withdraw() external { require(msg.sender == owner, "not owner"); payable(owner).transfer(address(this).balance); }
}
