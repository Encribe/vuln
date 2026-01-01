# multicall_exec_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | Wallet |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), unprotected generic execute (fixed version written for this benchmark) |
| Pattern | generic execute with no caller check lets anyone spend the contract's tokens and ETH |

MIT (solbend authors). See [LICENSE](LICENSE).
