# fee_split_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | FeeRouter |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), fee computed with rounding that underflows the protocol cut (fixed version written for this benchmark) |
| Pattern | the receiver's part is rounded up and the fee is taken from the remainder, paying out more than was paid in |

MIT (solbend authors). See [LICENSE](LICENSE).
