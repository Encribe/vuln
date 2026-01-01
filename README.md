# withdraw_from.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Pool |
| Solidity | 0.8.28 |
| Vulnerable function | withdrawFrom |
| Source | authored for this benchmark (no code copied), withdrawal on behalf of an owner without allowance |
| Pattern | withdraw for any owner to any receiver without checking the caller is allowed |

MIT (solbend authors). See [LICENSE](LICENSE).
