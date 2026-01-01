# borrow_shares_down.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | DebtPool |
| Solidity | 0.8.28 |
| Vulnerable function | borrow |
| Source | authored for this benchmark (no code copied), debt shares rounded down on borrow |
| Pattern | small borrows mint zero debt shares and are never repaid |

MIT (solbend authors). See [LICENSE](LICENSE).
