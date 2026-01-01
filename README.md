# au_HookVault1155.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | token-hooks |
| Contract | HookVault1155Buggy |
| Solidity | 0.8.35 |
| Vulnerable function | withdraw (onERC1155Received before the deposit is cleared) |
| Source | authored, solbend/examples/token-hooks |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
