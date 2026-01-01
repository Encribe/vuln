// The metamorphic class's not-applicable fixture (docs/classes/
// metamorphic.md): the contract neither deploys a contract nor trusts a
// keccak256-computed address, so the law does not apply. This is the safe
// "plain" row of the class corpus.
pragma solidity ^0.8.20;

contract MetaPlain {
    uint256 public stored;

    function set(uint256 v) external {
        stored = v;
    }

    function get() external view returns (uint256) {
        return stored;
    }
}
