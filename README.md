# free_rider_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | no-free-lunch |
| Contract | Marketplace |
| Solidity | 0.8.28 |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/free-rider/FreeRiderNFTMarketplace.sol (fixed version written for this benchmark) |
| Pattern | buyMany checks msg.value against each price instead of their sum, and pays the new owner |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. The ERC721 is replaced by an internal owner map. See [LICENSE](LICENSE).
