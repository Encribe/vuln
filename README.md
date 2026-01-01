# euler_donate.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | business-logic |
| Contract | EulerDonate |
| Solidity | 0.8.28 |
| Vulnerable function | donateToReserves |
| Source | authored for this benchmark (no code copied), minimized from rekt euler-rekt (Euler Finance, 2023) |
| Pattern | collateral lowered without a health check |

MIT (solbend authors). See [LICENSE](LICENSE).
