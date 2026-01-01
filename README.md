# pull_deposit.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | unchecked-call |
| Contract | PullDeposit |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (no code copied), the Cooler H-1 shape (Sherlock 2023-01 #335) |
| Pattern | a deposit credited on an unchecked transferFrom |

MIT (solbend authors). See [LICENSE](LICENSE).
