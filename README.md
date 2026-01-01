# unchecked_sub_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Wallet |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), balance check missing inside unchecked (fixed version written for this benchmark) |
| Pattern | unchecked subtraction without a balance check wraps the ledger |

MIT (solbend authors). See [LICENSE](LICENSE).
