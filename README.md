# FeeVaultNominal.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | fee-on-transfer |
| Contract | FeeVaultNominal |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (solbend examples/fee) |
| Pattern | a deposit credits the amount named while a fee-taking token delivers less |

MIT (solbend authors). See [LICENSE](LICENSE).
