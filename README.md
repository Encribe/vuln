# self_swap_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | InternalAmm |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pattern of Web3Bugs Marginswap H-02 (missing fromToken != toToken) (fixed version written for this benchmark) |
| Pattern | swapping a token for itself writes stale cached reserves and mints balance |

MIT (solbend authors). See [LICENSE](LICENSE).
