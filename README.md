# zap_payer.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Zap |
| Solidity | 0.8.28 |
| Vulnerable function | zapIn |
| Source | authored for this benchmark (no code copied), payer parameter in a zap contract |
| Pattern | zap pulls tokens from a caller chosen payer that approved the zap |

MIT (solbend authors). See [LICENSE](LICENSE).
