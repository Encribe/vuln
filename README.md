# unprotected_approve_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Treasury |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), unprotected approval of contract funds (fixed version written for this benchmark) |
| Pattern | anyone can make the contract approve an arbitrary spender for its tokens |

MIT (solbend authors). See [LICENSE](LICENSE).
