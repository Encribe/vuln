# sb_auction.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | griefing-dos |
| Contract | DosAuction |
| Solidity | 0.4.26 |
| Vulnerable function | bid (push refund, revert blocks bidding) |
| Source | https://github.com/smartbugs/smartbugs-curated/blob/main/dataset/denial_of_service/auction.sol |

SmartBugs curated (Apache-2.0 dataset); contract code from its original source, from not-so-smart-contracts (Apache-2.0). See [LICENSE](LICENSE).
