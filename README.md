# withdraw_round_down.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | SharePool |
| Solidity | 0.8.28 |
| Vulnerable function | withdraw |
| Source | authored for this benchmark (no code copied), ERC4626 withdraw rounding in the user's favour (EIP-4626 rounding rules) |
| Pattern | withdraw(assets) rounds the shares to burn down, so small withdrawals burn zero shares |

MIT (solbend authors). See [LICENSE](LICENSE).
