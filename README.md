# sb_send_loop.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | griefing-dos |
| Contract | Refunder |
| Solidity | 0.4.24 |
| Vulnerable function | refundAll (push payments in a loop) |
| Source | https://github.com/smartbugs/smartbugs-curated/blob/main/dataset/denial_of_service/send_loop.sol |

SmartBugs curated (Apache-2.0 dataset); contract code from its original source (ConsenSys best practices). See [LICENSE](LICENSE).
