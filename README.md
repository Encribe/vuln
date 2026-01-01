# fix_Vault_virtual_shares.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | vault-inflation |
| Contract | VaultVirtualShares |
| Solidity | 0.8.28 |
| Source | derived fix of solidity-by-example.org VaultInflation.sol (copied from oracle-manipulation/safe) |
| Pattern | virtual shares offset over the balance (the bounded-loss gap: refused, never proven) |

MIT. See [LICENSE](LICENSE).
