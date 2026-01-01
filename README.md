# side_entrance.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | solvency |
| Contract | SideEntranceLenderPool |
| Solidity | 0.8.28 |
| Vulnerable function | flashLoan |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/side-entrance/SideEntranceLenderPool.sol |
| Pattern | a flash loan repaid through deposit() credits the borrower with the pool's own ETH |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. See [LICENSE](LICENSE).
