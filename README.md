# allowance_not_spent.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | Token |
| Solidity | 0.8.28 |
| Vulnerable function | transferFrom |
| Source | authored for this benchmark (no code copied), ERC20 transferFrom that checks but never spends the allowance |
| Pattern | a spender approved for N can move N again and again |

MIT (solbend authors). See [LICENSE](LICENSE).
