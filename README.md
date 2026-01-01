# au_HookMint721.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | token-hooks |
| Contract | HookMint721Buggy |
| Solidity | 0.8.35 |
| Vulnerable function | claim (onERC721Received from _safeMint before the claim flag) |
| Source | authored, solbend/examples/token-hooks |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
