# sb_rubixi.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | access-control |
| Contract | Rubixi |
| Solidity | 0.4.24 |
| Vulnerable function | DynamicPyramid |
| Source | https://github.com/smartbugs/smartbugs-curated/tree/230e649/dataset/access_control/rubixi.sol |
| Note | misnamed constructor, anyone becomes creator and collects fees |

Apache-2.0. See [LICENSE](LICENSE).
