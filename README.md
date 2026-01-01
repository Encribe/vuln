# request_unmarked.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | WithdrawQueue |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), withdrawal request not marked as processed |
| Pattern | a matured withdrawal request can be claimed more than once |

MIT (solbend authors). See [LICENSE](LICENSE).
