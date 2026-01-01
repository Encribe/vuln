# OrderApprove.sol

A known-vulnerable example from the solbend class corpus, kept here to test solbend. The code is vulnerable on purpose. Do not deploy it.

| | |
|---|---|
| Dataset | solbend class corpus |
| Verdict | vulnerable |
| Class | transaction-order |
| Contract | OrderApprove |
| Solidity | 0.8.20 |
| Vulnerable function | approve/transferFrom (approve race) |
| Source | solbend/examples/ordering/OrderApprove.sol |

MIT (authored for solbend). See [LICENSE](LICENSE).
