# stake_pool_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | unchecked-call |
| Contract | StakePool |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), a stake recorded on an unchecked transferFrom (fixed version written for this benchmark) |
| Pattern | a false transferFrom answer records a stake nobody paid for |

MIT (solbend authors). See [LICENSE](LICENSE).
