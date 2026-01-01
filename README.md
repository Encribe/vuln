# zero_wrong_account_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | Deposits |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), balance cleared on the receiver instead of the caller (fixed version written for this benchmark) |
| Pattern | withdrawTo clears the receiver's balance and leaves the caller's in place |

MIT (solbend authors). See [LICENSE](LICENSE).
