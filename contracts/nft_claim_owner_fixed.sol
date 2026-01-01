// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: authored for this benchmark (no code copied), per-NFT claim keyed by holder (fixed version written for this benchmark)
// License: MIT (solbend authors)
interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address a) external view returns (uint256);
    function approve(address s, uint256 amount) external returns (bool);
}
contract HolderDrop {
    IERC20 public immutable token;
    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => bool) public claimed;
    uint256 public constant PER_NFT = 100e18;
    uint256 public nextId;
    constructor(IERC20 t) { token = t; }
    function mint() external payable { require(msg.value == 1 ether); ownerOf[nextId++] = msg.sender; }
    function transferNft(uint256 id, address to) external { require(ownerOf[id] == msg.sender); ownerOf[id] = to; }
    function claim(uint256 id) external {
        require(ownerOf[id] == msg.sender && !claimed[id]);
        claimed[id] = true;
        require(token.transfer(msg.sender, PER_NFT));
    }
}
