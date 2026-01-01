# arbitrary_from.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Vault |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (no code copied), pattern of Slither arbitrary-send-erc20 |
| Pattern | transferFrom with a caller chosen from address pulls any approver's tokens |

MIT (solbend authors). See [LICENSE](LICENSE).
