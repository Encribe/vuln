# decimals_scale_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | Wrapper |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), decimal scaling rounded up on the way out (fixed version written for this benchmark) |
| Pattern | unwrapping 18 decimal units to a 6 decimal token rounds up and pays out dust it never received |

MIT (solbend authors). See [LICENSE](LICENSE).
