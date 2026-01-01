# shards.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | rounding |
| Contract | ShardsMarket |
| Solidity | 0.8.28 |
| Vulnerable function | fill |
| Source | https://github.com/theredguild/damn-vulnerable-defi/tree/64fddf9f96de2782f8868898d68673acb295119c/src/shards/ShardsNFTMarketplace.sol |
| Pattern | fill rounds the payment down to zero for small purchases while cancel refunds rounded up |

MIT (Damn Vulnerable DeFi, Copyright (c) 2021). Reduced to one file, changes marked in the header. ERC1155, oracle and fees removed. See [LICENSE](LICENSE).
