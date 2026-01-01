# cancel_order_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | OrderBook |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), order cancel that refunds without deleting the order (fixed version written for this benchmark) |
| Pattern | cancel refunds the escrowed ETH and leaves the order open |

MIT (solbend authors). See [LICENSE](LICENSE).
