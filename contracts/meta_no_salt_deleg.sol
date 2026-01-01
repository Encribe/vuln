// The metamorphic class's safe fixture for a child deployed WITHOUT a salt that
// holds DELEGATECALL (docs/classes/metamorphic.md): its address is the
// deterministic CREATE address, so no one else can redeploy code there, and the
// child states no law of its own. The parent's own code is clean, so PROVEN.
pragma solidity ^0.8.20;

contract MetaDelegChild {
    function run(address t) external returns (bool ok) {
        (ok, ) = t.delegatecall("");
    }
}

contract MetaNoSaltDeleg {
    address public last;

    function deploy() external returns (address) {
        MetaDelegChild c = new MetaDelegChild();
        last = address(c);
        return last;
    }
}
