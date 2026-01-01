# compound_pending.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | Staker |
| Solidity | 0.8.28 |
| Vulnerable function | compound |
| Source | authored for this benchmark (no code copied), pending rewards spent by one path and not cleared |
| Pattern | compound() adds pending rewards to the stake without clearing them, then claim() pays them again |

MIT (solbend authors). See [LICENSE](LICENSE).
