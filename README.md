# meta_switch_safe.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | metamorphic |
| Contract | MetaSwitchSafe |
| Solidity | 0.8.20 |
| Source | authored for this benchmark (solbend, v11-create2-found) |
| Note | the factory and child shape of MetaSwitch without a kill, so no redeploy is possible and the law proves it |

MIT. See [LICENSE](LICENSE).
