# au_CurveVirtualPriceLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | LpLender |
| Solidity | 0.8.35 |
| Vulnerable function | liquidate, borrow (read CurveEthPool.get_virtual_price inside remove_liquidity ETH call) |
| Source | authored, re-creates dForce/Market.xyz/Midas |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
