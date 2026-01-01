# batch_msgvalue.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Gifts |
| Solidity | 0.8.28 |
| Vulnerable function | depositFor |
| Source | authored for this benchmark (no code copied), msg.value counted once per recipient in a batch |
| Pattern | a batch deposit credits msg.value to every recipient |

MIT (solbend authors). See [LICENSE](LICENSE).
