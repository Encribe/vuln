# router_call.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | SwapRouter |
| Solidity | 0.8.28 |
| Vulnerable function | swap |
| Source | authored for this benchmark (no code copied), pattern of the 2022 Transit Swap and 2023 Dexible approval drains |
| Pattern | router that users approve forwards caller chosen calldata to a caller chosen target |

MIT (solbend authors). See [LICENSE](LICENSE).
