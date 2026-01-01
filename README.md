# au_StaleRoundLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | oracle-manipulation |
| Contract | StaleRoundLender |
| Solidity | 0.8.35 |
| Vulnerable function | borrow (no updatedAt check), stale |
| Source | authored |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
