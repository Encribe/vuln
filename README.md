# unchecked_sub.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | Wallet |
| Solidity | 0.8.28 |
| Vulnerable function | withdraw |
| Source | authored for this benchmark (no code copied), balance check missing inside unchecked |
| Pattern | unchecked subtraction without a balance check wraps the ledger |

MIT (solbend authors). See [LICENSE](LICENSE).
