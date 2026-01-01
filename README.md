# mint_round_down.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | MintPool |
| Solidity | 0.8.28 |
| Vulnerable function | mint |
| Source | authored for this benchmark (no code copied), ERC4626 mint rounding in the user's favour |
| Pattern | mint(shares) rounds the assets to pay down, so small mints are free |

MIT (solbend authors). See [LICENSE](LICENSE).
