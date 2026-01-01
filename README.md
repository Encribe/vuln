# repay_shares_up.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | RepayPool |
| Solidity | 0.8.28 |
| Vulnerable function | repay |
| Source | authored for this benchmark (no code copied), debt shares burned rounded up on repay |
| Pattern | repaying dust burns one whole debt share worth more than the dust |

MIT (solbend authors). See [LICENSE](LICENSE).
