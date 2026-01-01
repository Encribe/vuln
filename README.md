# nft_claim_owner_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | HolderDrop |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), per-NFT claim keyed by holder (fixed version written for this benchmark) |
| Pattern | the claim flag is keyed by the holder, so moving the NFT lets a new holder claim again |

MIT (solbend authors). See [LICENSE](LICENSE).
