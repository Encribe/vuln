# compound_pending_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | Staker |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pending rewards spent by one path and not cleared (fixed version written for this benchmark) |
| Pattern | compound() adds pending rewards to the stake without clearing them, then claim() pays them again |

MIT (solbend authors). See [LICENSE](LICENSE).
