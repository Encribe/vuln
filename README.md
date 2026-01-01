# delegate_target_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Executor |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), user chosen call target with stored allowance (fixed version written for this benchmark) |
| Pattern | permit-style spender list checks the token but not the caller |

MIT (solbend authors). See [LICENSE](LICENSE).
