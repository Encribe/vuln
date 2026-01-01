# compound_index.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | business-logic |
| Contract | CompoundIndex |
| Solidity | 0.8.28 |
| Vulnerable function | accrue |
| Source | authored for this benchmark (no code copied), minimized from rekt compound-rekt (Compound, 2021) |
| Pattern | fresh holder's reward checkpoint reads 0 |

MIT (solbend authors). See [LICENSE](LICENSE).
