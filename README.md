# withdraw_memory.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | repeatable-withdrawal |
| Contract | Locker |
| Solidity | 0.8.28 |
| Vulnerable function | withdraw |
| Source | authored for this benchmark (no code copied), lock cleared on a memory copy |
| Pattern | withdraw clears a memory copy of the lock and can be called again |

MIT (solbend authors). See [LICENSE](LICENSE).
