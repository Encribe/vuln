# sb_random_number_generator.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | weak-randomness |
| Contract | RandomNumberGenerator |
| Solidity | 0.4.26 |
| Vulnerable function | random (private, no public caller) |
| Source | https://github.com/smartbugs/smartbugs-curated/blob/main/dataset/bad_randomness/random_number_generator.sol |

SmartBugs curated (Apache-2.0 dataset); contract code from its original source, from SWC-120 (MIT). See [LICENSE](LICENSE).
