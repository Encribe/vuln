# sb_parity_wallet_bug_2.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | unprotected-selfdestruct |
| Contract | WalletLibrary |
| Solidity | 0.4.24 |
| Vulnerable function | kill |
| Source | https://github.com/smartbugs/smartbugs-curated/tree/230e649/dataset/access_control/parity_wallet_bug_2.sol |
| Note | Parity hack 2 (Nov 2017): library initWallet then kill |

Apache-2.0. See [LICENSE](LICENSE).
