# truster_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | approval-drain |
| Contract | TrusterLenderPool |
| Solidity | 0.8.28 |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/truster/TrusterLenderPool.sol (fixed version written for this benchmark) |
| Pattern | flash loan runs an arbitrary call from the pool, so the pool can be made to approve the attacker |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. See [LICENSE](LICENSE).
