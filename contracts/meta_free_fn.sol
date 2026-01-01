// The metamorphic class's buggy twin for a salted SELFDESTRUCT child created in
// a file-level function (docs/classes/metamorphic.md): the scan reads the whole
// source unit, so the child's law is stated and NOT PROVEN naming the reachable
// SELFDESTRUCT. NEVER PROVEN.
pragma solidity ^0.8.20;

contract MetaFreeChild {
    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}

function meta_launch(bytes32 salt) returns (address) {
    return address(new MetaFreeChild{salt: salt}());
}

contract MetaFreeFn {
    address public last;

    function deploy(bytes32 salt) external returns (address) {
        last = meta_launch(salt);
        return last;
    }
}
