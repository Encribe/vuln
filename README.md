# refund_nozero_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | Crowdsale |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), crowdsale refund that keeps the contribution (fixed version written for this benchmark) |
| Pattern | refund pays the contribution without clearing it |

MIT (solbend authors). See [LICENSE](LICENSE).
