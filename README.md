# delegate_target.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Executor |
| Solidity | 0.8.28 |
| Vulnerable function | run |
| Source | authored for this benchmark (no code copied), user chosen call target with stored allowance |
| Pattern | permit-style spender list checks the token but not the caller |

MIT (solbend authors). See [LICENSE](LICENSE).
