# emergency_withdraw.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | Chef |
| Solidity | 0.8.28 |
| Vulnerable function | emergencyWithdraw |
| Source | authored for this benchmark (no code copied), MasterChef fork emergencyWithdraw that keeps the stake |
| Pattern | emergencyWithdraw pays the stake without resetting it |

MIT (solbend authors). See [LICENSE](LICENSE).
