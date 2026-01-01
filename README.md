# unchecked_transfer_from.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Escrow |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | authored for this benchmark (no code copied), unchecked ERC20 return value on deposit |
| Pattern | a token that returns false still credits the deposit |

MIT (solbend authors). See [LICENSE](LICENSE).
