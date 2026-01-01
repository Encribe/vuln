# meta_custom_init.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | metamorphic |
| Contract | MetaCustomInit |
| Solidity | 0.8.20 |
| Vulnerable function | deploy |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | the metamorphic shape, the child constructor returns a runtime it generates with inline assembly |

MIT. See [LICENSE](LICENSE).
