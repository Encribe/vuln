# zap_payer_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Zap |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), payer parameter in a zap contract (fixed version written for this benchmark) |
| Pattern | zap pulls tokens from a caller chosen payer that approved the zap |

MIT (solbend authors). See [LICENSE](LICENSE).
