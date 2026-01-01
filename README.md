# refund_nozero.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | Crowdsale |
| Solidity | 0.8.28 |
| Vulnerable function | refund |
| Source | authored for this benchmark (no code copied), crowdsale refund that keeps the contribution |
| Pattern | refund pays the contribution without clearing it |

MIT (solbend authors). See [LICENSE](LICENSE).
