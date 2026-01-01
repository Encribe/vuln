# nft_claim_owner.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | HolderDrop |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), per-NFT claim keyed by holder |
| Pattern | the claim flag is keyed by the holder, so moving the NFT lets a new holder claim again |

MIT (solbend authors). See [LICENSE](LICENSE).
