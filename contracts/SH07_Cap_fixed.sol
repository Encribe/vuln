pragma solidity 0.4.24;

contract Capped {
    uint256 public cap = 1000000;
}
contract Mintable is Capped {
    uint256 public supply;
    mapping(address => uint256) public bal;
    function mint(uint256 a) public {
        require(supply + a <= cap && supply + a >= supply);
        supply += a; bal[msg.sender] += a;
    }
}
