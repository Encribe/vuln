// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// A per-account ledger: credit and spend touch only the caller's own entry,
// and two different accounts' entries commute, so the order they are sent in
// changes nothing. This is the shape the change could over-generalise to:
// the class must stay PROVEN and no script may pass, because there is no
// order dependence to find.
contract OrderWallet {
    mapping(address => uint256) public owed;

    function credit(uint256 a) external {
        owed[msg.sender] += a;
    }

    function spend(uint256 a) external {
        require(owed[msg.sender] >= a, "owed");
        owed[msg.sender] -= a;
    }
}
