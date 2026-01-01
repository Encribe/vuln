# bridge_finalize.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | BridgeGateway |
| Solidity | 0.8.28 |
| Vulnerable function | finalizeWithdrawal |
| Source | authored for this benchmark (no code copied), bridge message replay |
| Pattern | a relayed withdrawal message is not marked as finalized, so it can be relayed again |

MIT (solbend authors). See [LICENSE](LICENSE).
