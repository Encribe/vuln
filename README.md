# fee_split.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | FeeRouter |
| Solidity | 0.8.28 |
| Vulnerable function | send |
| Source | authored for this benchmark (no code copied), fee computed with rounding that underflows the protocol cut |
| Pattern | the receiver's part is rounded up and the fee is taken from the remainder, paying out more than was paid in |

MIT (solbend authors). See [LICENSE](LICENSE).
