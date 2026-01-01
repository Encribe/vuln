# vesting_release_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | Vesting |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), vesting release without a released counter (fixed version written for this benchmark) |
| Pattern | release pays the whole vested amount each call instead of the unreleased part |

MIT (solbend authors). See [LICENSE](LICENSE).
