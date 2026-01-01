# meta_keccak_store.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | metamorphic |
| Contract | MetaKeccakStore |
| Solidity | 0.8.20 |
| Source | authored for this benchmark (solbend, v11-create2) |
| Note | a keccak address stored in a struct field before the cast, safe and refused by name |

MIT. See [LICENSE](LICENSE).
