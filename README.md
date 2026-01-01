# repay_shares_up_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | RepayPool |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), debt shares burned rounded up on repay (fixed version written for this benchmark) |
| Pattern | repaying dust burns one whole debt share worth more than the dust |

MIT (solbend authors). See [LICENSE](LICENSE).
