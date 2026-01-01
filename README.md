# meta_switch.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | metamorphic |
| Contract | MetaSwitch |
| Solidity | 0.8.20 |
| Vulnerable function | deploy |
| Source | authored for this benchmark (solbend, v11-create2-found) |
| Note | the true metamorphic shape, the same init code and salt install a wallet on the first deployment and a backdoor on the second, refused by the law and FOUND by the EVM witness on shanghai |

MIT. See [LICENSE](LICENSE).
