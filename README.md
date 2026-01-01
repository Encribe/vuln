# swc_proxy.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | controlled-delegatecall |
| Contract | Proxy |
| Solidity | 0.4.24 |
| Vulnerable function | forward |
| Source | https://github.com/SmartContractSecurity/SWC-registry/tree/891b059/test_cases/solidity/delegate_call_to_untrusted_callee/proxy |
| Note | same code as SmartBugs access_control/proxy.sol, counted once |

MIT. See [LICENSE](LICENSE).
