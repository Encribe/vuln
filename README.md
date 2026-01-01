# batch_claim.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | RewardDistributor |
| Solidity | 0.8.28 |
| Vulnerable function | claimRewards |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/the-rewarder/TheRewarderDistributor.sol |
| Pattern | batch claim checks every id before marking any, so a repeated id in one batch pays twice |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. The merkle proof is replaced by an owner set allocation. See [LICENSE](LICENSE).
