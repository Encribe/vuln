# sig_replay_fixed.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | double-claim |
| Contract | SignedDrop |
| Solidity | 0.8.28 |
| Source | authored for this benchmark (no code copied), signature claim without replay protection (SWC-121 pattern) (fixed version written for this benchmark) |
| Pattern | a signed voucher has no nonce or used flag and can be redeemed again |

MIT (solbend authors). See [LICENSE](LICENSE).
