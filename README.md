# treasure_qty.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | business-logic |
| Contract | TreasureQty |
| Solidity | 0.8.28 |
| Vulnerable function | buyItem |
| Source | authored for this benchmark (no code copied), minimized from rekt treasure-dao-rekt (Treasure DAO, 2022) |
| Pattern | item sold below its price (quantity 0) |

MIT (solbend authors). See [LICENSE](LICENSE).
