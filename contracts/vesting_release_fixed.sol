// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), vesting release without a released counter (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract Vesting {
    IERC20 public immutable token;
    address public immutable beneficiary;
    uint256 public immutable start;
    uint256 public immutable duration;
    uint256 public immutable total;
    uint256 public released;
    constructor(IERC20 t, address b, uint256 s, uint256 d, uint256 tot) { token = t; beneficiary = b; start = s; duration = d; total = tot; }
    function vested() public view returns (uint256) {
        if (block.timestamp < start) return 0;
        if (block.timestamp >= start + duration) return total;
        return total * (block.timestamp - start) / duration;
    }
    function release() external {
        uint256 due = vested() - released;
        released += due;
        require(token.transfer(beneficiary, due));
    }
}
