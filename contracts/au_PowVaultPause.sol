// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IERC20 { function transfer(address, uint256) external returns (bool); function transferFrom(address, address, uint256) external returns (bool); }
// item 10102: the owner pauses token withdrawals for good
contract PowVaultPause {
    IERC20 public immutable token;
    address public owner;
    mapping(address => uint256) public balances;
    bool public paused;
    function setPaused(bool p) external { require(msg.sender == owner); paused = p; }
    constructor(IERC20 _token) { token = _token; owner = msg.sender; }
    function deposit(uint256 a) external { require(token.transferFrom(msg.sender, address(this), a)); balances[msg.sender] += a; }
    function withdraw() external {
        require(!paused);
        uint256 a = balances[msg.sender];
        balances[msg.sender] = 0;
        require(token.transfer(msg.sender, a));
    }
}
