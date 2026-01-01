# memory_copy.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Bank |
| Solidity | 0.8.28 |
| Vulnerable function | withdraw |
| Source | authored for this benchmark (no code copied), storage vs memory data location |
| Pattern | withdraw decrements a memory copy of the account so the ledger never goes down |

MIT (solbend authors). See [LICENSE](LICENSE).
