// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// Source: https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/free-rider/FreeRiderNFTMarketplace.sol (fixed version written for this benchmark)
// License: MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. The ERC721 is replaced by an internal owner map
contract Marketplace {
    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => uint256) public offers;
    function list(uint256 id, uint256 price) external { if (ownerOf[id] == address(0)) ownerOf[id] = msg.sender; require(ownerOf[id] == msg.sender && price > 0); offers[id] = price; }
    function buyMany(uint256[] calldata ids) external payable {
        uint256 total;
        for (uint256 i = 0; i < ids.length; i++) {
            uint256 price = offers[ids[i]];
            require(price > 0, "not offered");
            total += price;
            delete offers[ids[i]];
            address seller = ownerOf[ids[i]];
            ownerOf[ids[i]] = msg.sender;
            (bool ok, ) = payable(seller).call{value: price}("");
            require(ok);
        }
        require(msg.value == total, "value");
    }
}
