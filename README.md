# ozu_enum_v2_bad.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | upgrade-storage-collision |
| Contract | StorageUpgrade_Enum_V2_Bad |
| Solidity | 0.6.12 |
| Source | https://github.com/OpenZeppelin/openzeppelin-upgrades/blob/034feb9/packages/core/contracts/test/Storage.sol |
| Note | enum members deleted, replaced, inserted, enum grows past one byte (label from the OpenZeppelin Upgrades storage.test.ts expectation) |

MIT. See [LICENSE](LICENSE).
