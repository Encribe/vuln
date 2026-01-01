// Fixed counterpart of SmartBugs curated access_control/FibonacciBalance.sol (library layout matches, no raw fallback forwarding), authored for the solbend class benchmark. SPDX-License-Identifier: MIT
pragma solidity ^0.4.22;
contract FibonacciBalance {
    address public fibonacciLibrary;
    uint public calculatedFibNumber;
    uint public start = 3;
    uint public withdrawalCounter;
    bytes4 constant fibSig = bytes4(keccak256("setFibonacci(uint256)"));
    constructor(address _fibonacciLibrary) public payable { fibonacciLibrary = _fibonacciLibrary; }
    function withdraw() public {
        withdrawalCounter += 1;
        require(fibonacciLibrary.delegatecall(fibSig, withdrawalCounter));
        msg.sender.transfer(calculatedFibNumber * 1 ether);
    }
}
contract FibonacciLib {
    address public fibonacciLibrary;
    uint public calculatedFibNumber;
    uint public start;
    function setFibonacci(uint n) public { calculatedFibNumber = fibonacci(n); }
    function fibonacci(uint n) internal returns (uint) {
        if (n == 0) return start;
        else if (n == 1) return start + 1;
        else return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
