# sb_parity_wallet_bug_1.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | unprotected-initializer |
| Contract | WalletLibrary |
| Solidity | 0.4.10 |
| Vulnerable function | initWallet |
| Source | https://github.com/smartbugs/smartbugs-curated/tree/230e649/dataset/access_control/parity_wallet_bug_1.sol |
| Note | Parity multisig hack 1 (July 2017): initWallet has no guard and is reachable through the Wallet fallback, anyone re-initializes owners. Pragma relaxed from 0.4.9 to ^0.4.9 so it compiles with 0.4.10 (SmartBugs notes it does not compile with 0.4.11) |

Apache-2.0. See [LICENSE](LICENSE).
