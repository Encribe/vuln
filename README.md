# VaultTrackedRewards.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | vault-inflation |
| Contract | VaultTrackedRewards |
| Solidity | 0.8.28 |
| Vulnerable function | addRewards |
| Source | authored for this benchmark (solbend examples/vault-inflation) |
| Pattern | an entry raises the tracked assets with no shares, inflating the price through the vault's own code |

MIT (solbend authors). See [LICENSE](LICENSE).
