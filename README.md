# unprotected_approve.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | Treasury |
| Solidity | 0.8.28 |
| Vulnerable function | approveSpender |
| Source | authored for this benchmark (no code copied), unprotected approval of contract funds |
| Pattern | anyone can make the contract approve an arbitrary spender for its tokens |

MIT (solbend authors). See [LICENSE](LICENSE).
