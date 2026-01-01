# harvest_debt.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | Farm |
| Solidity | 0.8.28 |
| Vulnerable function | harvest |
| Source | authored for this benchmark (no code copied), MasterChef style reward debt not updated on harvest |
| Pattern | harvest pays pending rewards without updating the reward debt |

MIT (solbend authors). See [LICENSE](LICENSE).
