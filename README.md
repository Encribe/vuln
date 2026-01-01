# sbe_VaultInflation.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | oracle-manipulation |
| Contract | Vault |
| Solidity | 0.8.35 |
| Vulnerable function | deposit (share price from balanceOf, donation), share price |
| Source | https://github.com/solidity-by-example/solidity-by-example.github.io/blob/main/contracts/src/hacks/vault-inflation/VaultInflation.sol |

MIT (solidity-by-example). See [LICENSE](LICENSE).
