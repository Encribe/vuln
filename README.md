# router_call_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | SwapRouter |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pattern of the 2022 Transit Swap and 2023 Dexible approval drains (fixed version written for this benchmark) |
| Pattern | router that users approve forwards caller chosen calldata to a caller chosen target |

MIT (solbend authors). See [LICENSE](LICENSE).
