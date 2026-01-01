# sweep_any.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Strategy |
| Solidity | 0.8.28 |
| Vulnerable function | sweep |
| Source | authored for this benchmark (no code copied), pattern of the Ethernaut DoubleEntryPoint sweep |
| Pattern | sweep of 'stray' tokens does not exclude the token that backs deposits |

MIT (solbend authors). See [LICENSE](LICENSE).
