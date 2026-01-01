# zero_wrong_account.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | Deposits |
| Solidity | 0.8.28 |
| Vulnerable function | withdrawTo |
| Source | authored for this benchmark (no code copied), balance cleared on the receiver instead of the caller |
| Pattern | withdrawTo clears the receiver's balance and leaves the caller's in place |

MIT (solbend authors). See [LICENSE](LICENSE).
