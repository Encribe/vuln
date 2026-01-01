# vault_inflation_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | Vault4626 |
| Solidity | 0.8.28 |
| Source | https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.0/contracts/token/ERC20/extensions/ERC4626.sol (virtual shares offset, reduced to one file) |
| Pattern | share price inflated by a donation rounds a victim's shares to zero |

MIT (OpenZeppelin). Pattern reduced to one file, code written for this benchmark. See [LICENSE](LICENSE).
