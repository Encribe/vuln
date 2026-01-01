# withdraw_round_down_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | SharePool |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), ERC4626 withdraw rounding in the user's favour (EIP-4626 rounding rules) (fixed version written for this benchmark) |
| Pattern | withdraw(assets) rounds the shares to burn down, so small withdrawals burn zero shares |

MIT (solbend authors). See [LICENSE](LICENSE).
