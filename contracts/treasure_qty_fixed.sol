// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Minimized from Treasure DAO (March 2022, $1.4M, rekt "treasure-dao-rekt"):
// buyItem charged price * quantity and transferred an ERC-721 whatever the
// quantity, so quantity 0 took a listed NFT for nothing. The mechanism: an
// item changes hands only for at least its listed price.

contract TreasureQtyFixed {
    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => uint256) public price;
    mapping(address => uint256) public proceeds;

    function list(uint256 id, uint256 p) external {
        require(ownerOf[id] == msg.sender, "owner");
        price[id] = p;
    }

    function mint(uint256 id) external {
        require(ownerOf[id] == address(0), "taken");
        ownerOf[id] = msg.sender;
    }

    function buyItem(uint256 id, uint256 quantity) external payable {
        require(price[id] > 0, "unlisted");
        require(quantity == 1, "erc721");
        require(msg.value == price[id] * quantity, "price");
        proceeds[ownerOf[id]] += msg.value;
        ownerOf[id] = msg.sender;
        price[id] = 0;
    }
}
