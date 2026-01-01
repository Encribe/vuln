# burn_before_price.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | ShareVault |
| Solidity | 0.8.28 |
| Vulnerable function | redeem |
| Source | authored for this benchmark (no code copied), shares burned before the redemption price is computed |
| Pattern | redeem burns shares first, so the price per share is computed over a smaller supply and pays out more |

MIT (solbend authors). See [LICENSE](LICENSE).
