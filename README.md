# withdraw_from_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Pool |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), withdrawal on behalf of an owner without allowance (fixed version written for this benchmark) |
| Pattern | withdraw for any owner to any receiver without checking the caller is allowed |

MIT (solbend authors). See [LICENSE](LICENSE).
