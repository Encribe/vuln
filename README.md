# vesting_release.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | Vesting |
| Solidity | 0.8.28 |
| Vulnerable function | release |
| Source | authored for this benchmark (no code copied), vesting release without a released counter |
| Pattern | release pays the whole vested amount each call instead of the unreleased part |

MIT (solbend authors). See [LICENSE](LICENSE).
