# au_PowEth.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | owner-trust-rugpull |
| Contract | PowEth |
| Solidity | 0.8.20 |
| Vulnerable function | sweep |
| Source | authored for this benchmark (solbend), solbend/examples/powers/PowEth.sol |
| Note | owner-law lane: the owner sweeps the depositors' ETH, eth power replayed |

MIT. See [LICENSE](LICENSE).
