# mint_round_down_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | rounding |
| Contract | MintPool |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), ERC4626 mint rounding in the user's favour (fixed version written for this benchmark) |
| Pattern | mint(shares) rounds the assets to pay down, so small mints are free |

MIT (solbend authors). See [LICENSE](LICENSE).
