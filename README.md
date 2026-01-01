# dvd_PuppetPool.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | oracle-manipulation |
| Contract | PuppetPool |
| Solidity | 0.8.25 |
| Vulnerable function | borrow (_computeOraclePrice from Uniswap V1 balances), spot |
| Source | https://github.com/tinchoabbate/damn-vulnerable-defi/blob/master/src/puppet/PuppetPool.sol |

MIT (Damn Vulnerable DeFi). See [LICENSE](LICENSE).
