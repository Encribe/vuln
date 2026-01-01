// Derived fix of SWC-128 dos_address.sol (MIT): the creditor list is a counter
// reset in constant gas, never a whole array rewrite.
pragma solidity ^0.4.25;

contract DosGasBounded {
    mapping(uint => address) creditorAddresses;
    uint creditorCount;
    uint epoch;
    bool win = false;

    function emptyCreditors() public {
        if (creditorCount > 1500) {
            creditorCount = 0;
            epoch += 1;
            win = true;
        }
    }

    function addCreditor() public returns (bool) {
        creditorAddresses[creditorCount] = msg.sender;
        creditorCount += 1;
        return true;
    }

    function iWin() public view returns (bool) {
        return win;
    }

    function numberCreditors() public view returns (uint) {
        return creditorCount;
    }
}
