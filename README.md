# msgvalue_multicall.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | Seller |
| Solidity | 0.8.28 |
| Vulnerable function | buy |
| Source | authored for this benchmark (no code copied), msg.value reused across delegatecall multicall entries |
| Pattern | a delegatecall multicall lets one msg.value pay for every buy |

MIT (solbend authors). See [LICENSE](LICENSE).
