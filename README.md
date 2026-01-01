# burn_before_price_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | ShareVault |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), shares burned before the redemption price is computed (fixed version written for this benchmark) |
| Pattern | redeem burns shares first, so the price per share is computed over a smaller supply and pays out more |

MIT (solbend authors). See [LICENSE](LICENSE).
