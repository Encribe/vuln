# swap_round_up.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | RateSwap |
| Solidity | 0.8.28 |
| Vulnerable function | swap |
| Source | authored for this benchmark (no code copied), fixed rate swap rounding output up |
| Pattern | output is rounded up, so every dust swap pays one extra unit |

MIT (solbend authors). See [LICENSE](LICENSE).
