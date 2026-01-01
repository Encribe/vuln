# sbe_VaultInflation.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | vault-inflation |
| Contract | Vault |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | solidity-by-example.org hacks/vault-inflation/VaultInflation.sol (copied from oracle-manipulation/buggy) |
| Pattern | a first deposit and a donation round the next deposit to zero shares |

MIT. See [LICENSE](LICENSE).
