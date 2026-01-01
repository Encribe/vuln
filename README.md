# harvest_debt_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | Farm |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), MasterChef style reward debt not updated on harvest (fixed version written for this benchmark) |
| Pattern | harvest pays pending rewards without updating the reward debt |

MIT (solbend authors). See [LICENSE](LICENSE).
