# allowance_not_spent_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | Token |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), ERC20 transferFrom that checks but never spends the allowance (fixed version written for this benchmark) |
| Pattern | a spender approved for N can move N again and again |

MIT (solbend authors). See [LICENSE](LICENSE).
