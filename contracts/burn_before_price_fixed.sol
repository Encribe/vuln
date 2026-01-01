// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), shares burned before the redemption price is computed (fixed version written for this benchmark)
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
        uint256 out = s * address(this).balance / totalShares;
        shares[msg.sender] -= s;
        totalShares -= s;
        (bool ok, ) = msg.sender.call{value: out}("");
        require(ok);
    }
}
