# swap_round_up_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | RateSwap |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), fixed rate swap rounding output up (fixed version written for this benchmark) |
| Pattern | output is rounded up, so every dust swap pays one extra unit |

MIT (solbend authors). See [LICENSE](LICENSE).
