# mythril_destruct.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | unprotected-selfdestruct |
| Contract | WalletLibrary |
| Solidity | 0.5.0 |
| Vulnerable function | kill |
| Source | https://github.com/ConsenSys/mythril/tree/125914a/tests/testdata/input_contracts/destruct.sol |
| Note | Parity hack 2 shape: the deployed library is uninitialized, anyone calls initMultiowned then kill |

MIT. See [LICENSE](LICENSE).
