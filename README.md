# au_BalancerRateLenderHalfChecked.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | RateLenderHalf |
| Solidity | 0.8.35 |
| Vulnerable function | liquidate (borrow is checked, liquidate is not) |
| Source | authored, partial-fix shape |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
