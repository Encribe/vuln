# airdrop_noflag.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | Airdrop |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), airdrop without a claimed flag |
| Pattern | allocation can be claimed again and again |

MIT (solbend authors). See [LICENSE](LICENSE).
