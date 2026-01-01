# self_transfer_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | solvency |
| Contract | Ledger |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), cached balances in an internal transfer (self-transfer) (fixed version written for this benchmark) |
| Pattern | transfer to oneself writes back a cached sender balance after crediting, creating balance |

MIT (solbend authors). See [LICENSE](LICENSE).
