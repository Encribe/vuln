# bridge_finalize_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | repeatable-withdrawal |
| Contract | BridgeGateway |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), bridge message replay (fixed version written for this benchmark) |
| Pattern | a relayed withdrawal message is not marked as finalized, so it can be relayed again |

MIT (solbend authors). See [LICENSE](LICENSE).
