# emergency_withdraw_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | Chef |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), MasterChef fork emergencyWithdraw that keeps the stake (fixed version written for this benchmark) |
| Pattern | emergencyWithdraw pays the stake without resetting it |

MIT (solbend authors). See [LICENSE](LICENSE).
