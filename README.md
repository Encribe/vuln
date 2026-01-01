# sb_fibonacci_balance.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | controlled-delegatecall |
| Contract | FibonacciBalance |
| Solidity | 0.4.24 |
| Vulnerable function | fallback |
| Source | https://github.com/smartbugs/smartbugs-curated/tree/230e649/dataset/access_control/FibonacciBalance.sol |
| Note | fallback forwards calldata, setStart writes slot 0 (the library address) |

Apache-2.0. See [LICENSE](LICENSE).
