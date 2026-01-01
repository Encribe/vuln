# claim_index_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | IndexedDrop |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), claimed flag keyed by a caller chosen index (fixed version written for this benchmark) |
| Pattern | the claimed bitmap is keyed by an index that is not bound to the allocation |

MIT (solbend authors). See [LICENSE](LICENSE).
