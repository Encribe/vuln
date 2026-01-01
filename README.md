# sig_replay.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | double-claim |
| Contract | SignedDrop |
| Solidity | 0.8.28 |
| Vulnerable function | claim |
| Source | authored for this benchmark (no code copied), signature claim without replay protection (SWC-121 pattern) |
| Pattern | a signed voucher has no nonce or used flag and can be redeemed again |

MIT (solbend authors). See [LICENSE](LICENSE).
