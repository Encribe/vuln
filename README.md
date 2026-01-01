# reward_no_checkpoint.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | StakingRewards |
| Solidity | 0.8.28 |
| Vulnerable function | getReward |
| Source | authored for this benchmark (no code copied), reward per token without a per user checkpoint |
| Pattern | a late staker is paid rewards that accrued before it staked |

MIT (solbend authors). See [LICENSE](LICENSE).
