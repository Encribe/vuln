# claim_index.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | IndexedDrop |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), claimed flag keyed by a caller chosen index |
| Pattern | the claimed bitmap is keyed by an index that is not bound to the allocation |

MIT (solbend authors). See [LICENSE](LICENSE).
