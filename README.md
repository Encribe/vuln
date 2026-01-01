# arbitrary_from_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Vault |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), pattern of Slither arbitrary-send-erc20 (fixed version written for this benchmark) |
| Pattern | transferFrom with a caller chosen from address pulls any approver's tokens |

MIT (solbend authors). See [LICENSE](LICENSE).
