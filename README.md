# al_vault_reinit_buggy.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | access-control |
| Contract | AlVaultReinit |
| Solidity | 0.8.24 |
| Vulnerable function | initialize |
| Source | authored for this benchmark (solbend, v11cls-access-law) |
| Note | re-initializable owner, anyone sweeps the deposits |

MIT. See [LICENSE](LICENSE).
