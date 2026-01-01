# sig_withdraw_nonce_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | SignedVault |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), signed withdrawal whose nonce is never advanced (fixed version written for this benchmark) |
| Pattern | a withdrawal signature stays valid after use because the nonce is not incremented |

MIT (solbend authors). See [LICENSE](LICENSE).
