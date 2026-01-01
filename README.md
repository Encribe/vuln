# deposit_param_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | EthVault |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), credited amount taken from a parameter instead of msg.value (fixed version written for this benchmark) |
| Pattern | deposit credits a caller chosen amount regardless of the ETH sent |

MIT (solbend authors). See [LICENSE](LICENSE).
