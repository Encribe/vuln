// SPDX-License-Identifier: MIT
// Derived fix of Ethernaut Denial.sol (file header MIT, repository AGPL-3.0):
// the partner share is credited and pulled, so the partner cannot burn the
// owner's gas or block the owner's withdrawal.
pragma solidity ^0.8.0;

contract DenialPull {
    address public partner;
    address public constant owner = address(0xA9E);
    uint256 timeLastWithdrawn;
    mapping(address => uint256) withdrawPartnerBalances;
    mapping(address => uint256) public owed;

    function setWithdrawPartner(address _partner) public {
        partner = _partner;
    }

    function withdraw() public {
        uint256 amountToSend = address(this).balance / 100;
        owed[partner] += amountToSend;
        payable(owner).transfer(amountToSend);
        timeLastWithdrawn = block.timestamp;
        withdrawPartnerBalances[partner] += amountToSend;
    }

    function claim() public {
        uint256 amount = owed[msg.sender];
        owed[msg.sender] = 0;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok);
    }

    receive() external payable {}

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
