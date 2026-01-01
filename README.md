# sb_dos_number.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | griefing-dos |
| Contract | DosNumber |
| Solidity | 0.4.26 |
| Vulnerable function | insertNnumbers, clearDOS (unbounded loop) |
| Source | https://github.com/smartbugs/smartbugs-curated/blob/main/dataset/denial_of_service/dos_number.sol |

SmartBugs curated (Apache-2.0 dataset); contract code from its original source, from SWC-128 (MIT). See [LICENSE](LICENSE).
