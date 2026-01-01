# sweep_any_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Strategy |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pattern of the Ethernaut DoubleEntryPoint sweep (fixed version written for this benchmark) |
| Pattern | sweep of 'stray' tokens does not exclude the token that backs deposits |

MIT (solbend authors). See [LICENSE](LICENSE).
