# downcast_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Pot |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), unsafe downcast in the ledger update (fixed version written for this benchmark) |
| Pattern | withdraw subtracts a truncated amount but pays the full amount |

MIT (solbend authors). See [LICENSE](LICENSE).
