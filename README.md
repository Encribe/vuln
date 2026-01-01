# decimals_scale.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | Wrapper |
| Solidity | 0.8.28 |
| Vulnerable function | unwrap |
| Source | authored for this benchmark (no code copied), decimal scaling rounded up on the way out |
| Pattern | unwrapping 18 decimal units to a 6 decimal token rounds up and pays out dust it never received |

MIT (solbend authors). See [LICENSE](LICENSE).
