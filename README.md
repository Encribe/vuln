# swc_proxy_pattern_false_positive.sol

A safe example from the solbend class corpus, kept here to test solbend: a scan of it should prove it. It is the fixed side of an example whose buggy side is a branch of its own.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | safe |
| Class | controlled-delegatecall |
| Contract | proxy |
| Solidity | 0.4.24 |
| Source | https://github.com/SmartContractSecurity/SWC-registry/tree/891b059/test_cases/solidity/delegate_call_to_untrusted_callee/proxy_pattern_false_positive |
| Note | delegatecall result must be false, so no state change survives |

MIT. See [LICENSE](LICENSE).
