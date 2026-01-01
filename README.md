# fee_on_transfer.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Vault |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (no code copied), fee-on-transfer token credited at the nominal amount |
| Pattern | deposit credits the requested amount, not the amount the vault received |

MIT (solbend authors). See [LICENSE](LICENSE).
