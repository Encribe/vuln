# au_CallbackPairLender.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | read-only-reentrancy |
| Contract | PairLender |
| Solidity | 0.8.35 |
| Vulnerable function | borrow, liquidate (read CallbackPair.lpPrice inside onBurn) |
| Source | authored, re-creates EraLend/SyncSwap |

authored for this benchmark (MIT). See [LICENSE](LICENSE).
