# vault_inflation.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | Vault4626 |
| Solidity | 0.8.28 |
| Vulnerable function | deposit |
| Source | https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/extensions/ERC4626.sol (first depositor inflation, fixed in v4.9.0) |
| Pattern | share price inflated by a donation rounds a victim's shares to zero |

MIT (OpenZeppelin). Pattern reduced to one file, code written for this benchmark. See [LICENSE](LICENSE).
