# unchecked_transfer_from_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Escrow |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), unchecked ERC20 return value on deposit (fixed version written for this benchmark) |
| Pattern | a token that returns false still credits the deposit |

MIT (solbend authors). See [LICENSE](LICENSE).
