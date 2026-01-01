# liquidate_healthy.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | Lender |
| Solidity | 0.8.28 |
| Vulnerable function | liquidate |
| Source | authored for this benchmark (no code copied), liquidation without a health check |
| Pattern | anyone can liquidate a healthy position and take its collateral at a discount |

MIT (solbend authors). See [LICENSE](LICENSE).
