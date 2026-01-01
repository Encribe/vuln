# meta_no_salt_deleg.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | metamorphic |
| Contract | MetaNoSaltDeleg |
| Solidity | 0.8.20 |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | an unsalted child with DELEGATECALL, its address cannot be redeployed so it states no law |

MIT. See [LICENSE](LICENSE).
