# ozu_customgap_v2_bad_switched_gaps.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | upgrade-storage-collision |
| Contract | StorageUpgrade_CustomGap_V2_Bad_Switched_Gaps |
| Solidity | 0.6.12 |
| Source | https://github.com/OpenZeppelin/openzeppelin-upgrades/blob/034feb9/packages/core/contracts/test/Storage.sol |
| Note | first gap not shrunk, b and c move (label from the OpenZeppelin Upgrades storage.test.ts expectation) |

MIT. See [LICENSE](LICENSE).
