# memory_copy_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Bank |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), storage vs memory data location (fixed version written for this benchmark) |
| Pattern | withdraw decrements a memory copy of the account so the ledger never goes down |

MIT (solbend authors). See [LICENSE](LICENSE).
