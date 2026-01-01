# stake_pool.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | unchecked-call |
| Contract | StakePool |
| Solidity | 0.8.28 |
| Vulnerable function | stake |
| Source | authored for this benchmark (no code copied), a stake recorded on an unchecked transferFrom |
| Pattern | a false transferFrom answer records a stake nobody paid for |

MIT (solbend authors). See [LICENSE](LICENSE).
