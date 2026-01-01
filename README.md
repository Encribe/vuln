# request_unmarked_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | WithdrawQueue |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), withdrawal request not marked as processed (fixed version written for this benchmark) |
| Pattern | a matured withdrawal request can be claimed more than once |

MIT (solbend authors). See [LICENSE](LICENSE).
