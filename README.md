# au_BalancerRateLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | RateLender |
| Solidity | 0.8.35 |
| Vulnerable function | borrow, liquidate (read RateVault.getRate inside exit ETH call) |
| Source | authored, re-creates Sturdy/Sentiment |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
