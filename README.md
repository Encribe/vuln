# meta_deleg_init.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | metamorphic |
| Contract | MetaDelegInit |
| Solidity | 0.8.20 |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | the child constructor delegatecalls an unread address, safe and refused by name |

MIT. See [LICENSE](LICENSE).
