# sig_withdraw_nonce.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | SignedVault |
| Solidity | 0.8.28 |
| Vulnerable function | withdraw |
| Source | authored for this benchmark (no code copied), signed withdrawal whose nonce is never advanced |
| Pattern | a withdrawal signature stays valid after use because the nonce is not incremented |

MIT (solbend authors). See [LICENSE](LICENSE).
