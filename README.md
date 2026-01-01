# claim_memory.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | Rewards |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), claimed flag written to a memory copy |
| Pattern | the claimed flag is set on a memory struct and never persisted |

MIT (solbend authors). See [LICENSE](LICENSE).
