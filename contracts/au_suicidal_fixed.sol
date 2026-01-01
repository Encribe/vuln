// SPDX-License-Identifier: MIT
// Fixed counterpart of Slither tests suicidal/0.7.6/suicidal.sol, authored for the solbend class benchmark.
pragma solidity 0.7.6;
contract C {
    address owner;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner); _; }
    function i_am_a_backdoor() public onlyOwner { selfdestruct(msg.sender); }
    function i_am_a_backdoor2(address payable to) public onlyOwner { internal_selfdestruct(to); }
    function internal_selfdestruct(address payable to) internal { selfdestruct(to); }
}
