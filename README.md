# msgvalue_multicall_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | Seller |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), msg.value reused across delegatecall multicall entries (fixed version written for this benchmark) |
| Pattern | a delegatecall multicall lets one msg.value pay for every buy |

MIT (solbend authors). See [LICENSE](LICENSE).
