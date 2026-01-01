# deposit_param.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | EthVault |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (no code copied), credited amount taken from a parameter instead of msg.value |
| Pattern | deposit credits a caller chosen amount regardless of the ETH sent |

MIT (solbend authors). See [LICENSE](LICENSE).
