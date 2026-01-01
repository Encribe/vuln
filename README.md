# batch_msgvalue_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Gifts |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), msg.value counted once per recipient in a batch (fixed version written for this benchmark) |
| Pattern | a batch deposit credits msg.value to every recipient |

MIT (solbend authors). See [LICENSE](LICENSE).
