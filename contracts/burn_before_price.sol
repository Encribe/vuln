// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), shares burned before the redemption price is computed
// License: MIT (solbend authors)
contract ShareVault {
    mapping(address => uint256) public shares;
    uint256 public totalShares;
    function deposit() external payable {
        uint256 assets = address(this).balance - msg.value;
        uint256 s = totalShares == 0 ? msg.value : msg.value * totalShares / assets;
        shares[msg.sender] += s; totalShares += s;
    }
    function redeem(uint256 s) external {
        shares[msg.sender] -= s;
        totalShares -= s;
        uint256 out = totalShares == 0 ? address(this).balance : s * address(this).balance / totalShares;
        if (out > address(this).balance) out = address(this).balance;
        (bool ok, ) = msg.sender.call{value: out}("");
        require(ok);
    }
}
