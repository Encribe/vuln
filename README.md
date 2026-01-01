# bridge_call.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Bridge |
| Solidity | 0.8.28 |
| Vulnerable function | bridgeWithCall |
| Source | authored for this benchmark (no code copied), pattern of the 2022 LI.FI and 2024 Socket arbitrary call incidents |
| Pattern | bridge executes a caller supplied call so it can move tokens users approved to it |

MIT (solbend authors). See [LICENSE](LICENSE).
