# spartan_reserve.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | business-logic |
| Contract | SpartanReserve |
| Solidity | 0.8.28 |
| Vulnerable function | removeLiquidity |
| Source | authored for this benchmark (no code copied), minimized from rekt spartan-rekt (Spartan Protocol, 2021) |
| Pattern | burn priced at the donatable live balance |

MIT (solbend authors). See [LICENSE](LICENSE).
