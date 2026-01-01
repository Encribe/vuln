# bridge_call_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Bridge |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pattern of the 2022 LI.FI and 2024 Socket arbitrary call incidents (fixed version written for this benchmark) |
| Pattern | bridge executes a caller supplied call so it can move tokens users approved to it |

MIT (solbend authors). See [LICENSE](LICENSE).
