# reward_no_checkpoint_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | StakingRewards |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), reward per token without a per user checkpoint (fixed version written for this benchmark) |
| Pattern | a late staker is paid rewards that accrued before it staked |

MIT (solbend authors). See [LICENSE](LICENSE).
