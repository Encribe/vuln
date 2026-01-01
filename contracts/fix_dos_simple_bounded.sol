// Derived fix of SWC-128 dos_simple.sol (MIT): one push per call and a
// constant-gas reset.
pragma solidity ^0.4.25;

contract DosOneFuncBounded {
    mapping(uint => address) listAddresses;
    uint count;

    function ifillArray() public returns (bool) {
        if (count < 1500) {
            listAddresses[count] = msg.sender;
            count += 1;
            return true;
        } else {
            count = 0;
            return false;
        }
    }
}
