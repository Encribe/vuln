# au_TwoViewLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | TwoViewLender |
| Solidity | 0.8.35 |
| Vulnerable function | borrow, liquidate (read the unguarded lp_price) |
| Source | authored, re-creates the Conic shape |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
