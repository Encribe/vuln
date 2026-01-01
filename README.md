# multicall_exec.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Wallet |
| Solidity | 0.8.28 |
| Vulnerable function | execute |
| Source | authored for this benchmark (no code copied), unprotected generic execute |
| Pattern | generic execute with no caller check lets anyone spend the contract's tokens and ETH |

MIT (solbend authors). See [LICENSE](LICENSE).
