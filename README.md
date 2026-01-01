# free_rider.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | no-free-lunch |
| Contract | Marketplace |
| Solidity | 0.8.28 |
| Vulnerable function | buyMany |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/free-rider/FreeRiderNFTMarketplace.sol |
| Pattern | buyMany checks msg.value against each price instead of their sum, and pays the new owner |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. The ERC721 is replaced by an internal owner map. See [LICENSE](LICENSE).
