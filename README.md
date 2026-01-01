# cancel_order.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | OrderBook |
| Solidity | 0.8.28 |
| Vulnerable function | cancel |
| Source | authored for this benchmark (no code copied), order cancel that refunds without deleting the order |
| Pattern | cancel refunds the escrowed ETH and leaves the order open |

MIT (solbend authors). See [LICENSE](LICENSE).
