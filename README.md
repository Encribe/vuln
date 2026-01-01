# ozu_uint256gap_address_v2.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | upgrade-storage-collision |
| Contract | StorageUpgrade_Uint256Gap_Address_V2 |
| Solidity | 0.6.12 |
| Source | https://github.com/OpenZeppelin/openzeppelin-upgrades/blob/034feb9/packages/core/contracts/test/Storage.sol |
| Note | address fills a uint256 gap slot (label from the OpenZeppelin Upgrades storage.test.ts expectation) |

MIT. See [LICENSE](LICENSE).
