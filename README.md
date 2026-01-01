# withdraw_memory_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | Locker |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), lock cleared on a memory copy (fixed version written for this benchmark) |
| Pattern | withdraw clears a memory copy of the lock and can be called again |

MIT (solbend authors). See [LICENSE](LICENSE).
