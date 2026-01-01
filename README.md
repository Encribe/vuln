# truster.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | approval-drain |
| Contract | TrusterLenderPool |
| Solidity | 0.8.28 |
| Vulnerable function | flashLoan |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/truster/TrusterLenderPool.sol |
| Pattern | flash loan runs an arbitrary call from the pool, so the pool can be made to approve the attacker |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. See [LICENSE](LICENSE).
