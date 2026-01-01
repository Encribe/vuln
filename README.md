# self_swap.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | InternalAmm |
| Solidity | 0.8.28 |
| Vulnerable function | swap |
| Source | authored for this benchmark (no code copied), pattern of Web3Bugs Marginswap H-02 (missing fromToken != toToken) |
| Pattern | swapping a token for itself writes stale cached reserves and mints balance |

MIT (solbend authors). See [LICENSE](LICENSE).
