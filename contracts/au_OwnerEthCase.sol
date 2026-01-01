// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The owner class's ETH half, provable: a pull-payment bank with no gate and
// no owner-only function. Every payout debits the caller's own entry by the
// same amount the balance falls by, so owner.eth.<f>.owner holds for each
// function:
//   deposit  -- balance up by msg.value, the caller's entry up by msg.value
//   withdraw -- balance down by amount, the caller's entry down by amount
//               (the function's own condition: amount <= balances[msg.sender])
//   transfer -- balance unchanged, the caller's entry down by amount
// and every other function (none) leaves both as they were (le_refl). The
// withdrawal half's laws hold too, so this contract's class row reads proven
// (proven_qualified when the reentrancy verdict is not proven).
contract OwnerEthCase {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
