# liquidate_healthy_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | Lender |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), liquidation without a health check (fixed version written for this benchmark) |
| Pattern | anyone can liquidate a healthy position and take its collateral at a discount |

MIT (solbend authors). See [LICENSE](LICENSE).
