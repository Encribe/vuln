# meta_free_fn.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | metamorphic |
| Contract | MetaFreeFn |
| Solidity | 0.8.20 |
| Vulnerable function | deploy |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | a salted SELFDESTRUCT child created in a file-level function |

MIT. See [LICENSE](LICENSE).
