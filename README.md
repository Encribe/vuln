# au_HookVaultLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | HookShareLender |
| Solidity | 0.8.35 |
| Vulnerable function | borrow, liquidate (read HookVault.pricePerShare inside the token hook) |
| Source | authored, ERC777 hook shape |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
