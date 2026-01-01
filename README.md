# self_transfer.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Ledger |
| Solidity | 0.8.28 |
| Vulnerable function | transfer |
| Source | authored for this benchmark (no code copied), cached balances in an internal transfer (self-transfer) |
| Pattern | transfer to oneself writes back a cached sender balance after crediting, creating balance |

MIT (solbend authors). See [LICENSE](LICENSE).
