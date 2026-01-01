# au_PowSeize.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | owner-trust-rugpull |
| Contract | PowSeize |
| Solidity | 0.8.20 |
| Vulnerable function | burnFrom |
| Source | authored for this benchmark (solbend), solbend/examples/powers/PowSeize.sol |
| Note | owner-law lane: the owner burns a user's balance, seize power replayed |

MIT. See [LICENSE](LICENSE).
