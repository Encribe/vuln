# meta_redeploy.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | metamorphic |
| Contract | MetaRedeploy |
| Solidity | 0.8.20 |
| Vulnerable function | kill |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | CREATE2 reuse after selfdestruct, the same init code and salt are redeployed, so an address-assumption row rather than a metamorphic one |

MIT. See [LICENSE](LICENSE).
