# vuln

Vulnerable and safe Solidity contracts for testing solbend.

A branch named `vulnerable/...` holds a contract with a known bug, kept here because a scan should find it. A branch named `safe/...` holds a contract without one, kept here because a scan should prove it.

## main

| Contract | What it shows |
|---|---|
| `contracts/BankDAO.sol` | the DAO bug: the balance is cleared after the external call |
| `contracts/BankCEI.sol` | the fix: the balance is cleared before the call (checks-effects-interactions) |
| `contracts/BankGuarded.sol` | the other fix: a reentrancy lock on every entry point |

## Branches

697 branches, one contract each, named `<vulnerable|safe>/<dataset>/<class>/<contract>`. Each holds the contract under `contracts/`, a README with its source and labels, and its licence. The full list is in [BRANCHES.md](BRANCHES.md).

### Vulnerable: 452

| Dataset | Class | Branches |
|---|---|---|
| classes | access-control | 13 |
| classes | approval-drain | 10 |
| classes | arbitrary-storage-write | 10 |
| classes | business-logic | 5 |
| classes | controlled-delegatecall | 6 |
| classes | double-claim | 9 |
| classes | fee-on-transfer | 1 |
| classes | flash-loan-governance | 2 |
| classes | griefing-dos | 7 |
| classes | metamorphic | 7 |
| classes | no-free-lunch | 8 |
| classes | oracle-manipulation | 7 |
| classes | owner-trust-rugpull | 24 |
| classes | read-only-reentrancy | 6 |
| classes | repeatable-withdrawal | 8 |
| classes | rounding | 9 |
| classes | signature | 4 |
| classes | solvency | 8 |
| classes | state-variable-shadowing | 10 |
| classes | strict-balance-equality | 10 |
| classes | timestamp-dependence | 1 |
| classes | token-hooks | 4 |
| classes | transaction-order | 4 |
| classes | tx-origin-auth | 2 |
| classes | unchecked-call | 2 |
| classes | uninitialized-storage-pointer | 10 |
| classes | unprotected-initializer | 7 |
| classes | unprotected-selfdestruct | 8 |
| classes | upgrade-storage-collision | 25 |
| classes | vault-inflation | 3 |
| classes | weak-randomness | 4 |
| nssc | bad_randomness | 1 |
| nssc | denial_of_service | 2 |
| nssc | forced_ether_reception | 1 |
| nssc | honeypots | 6 |
| nssc | incorrect_interface | 2 |
| nssc | integer_overflow | 1 |
| nssc | race_condition | 1 |
| nssc | reentrancy | 5 |
| nssc | unchecked_external_call | 1 |
| nssc | unprotected_function | 2 |
| nssc | variable-shadowing | 1 |
| nssc | wrong_constructor_name | 2 |
| smartbugs | access_control | 18 |
| smartbugs | arithmetic | 15 |
| smartbugs | bad_randomness | 8 |
| smartbugs | denial_of_service | 6 |
| smartbugs | front_running | 4 |
| smartbugs | other | 3 |
| smartbugs | reentrancy | 31 |
| smartbugs | short_addresses | 1 |
| smartbugs | time_manipulation | 5 |
| smartbugs | unchecked_low_level_calls | 52 |
| solidifi | reentrancy | 50 |

### Safe: 245

| Dataset | Class | Branches |
|---|---|---|
| classes | access-control | 16 |
| classes | approval-drain | 10 |
| classes | arbitrary-storage-write | 10 |
| classes | business-logic | 5 |
| classes | controlled-delegatecall | 10 |
| classes | double-claim | 9 |
| classes | fee-on-transfer | 1 |
| classes | flash-loan-governance | 2 |
| classes | griefing-dos | 10 |
| classes | metamorphic | 13 |
| classes | no-free-lunch | 8 |
| classes | oracle-manipulation | 8 |
| classes | owner-trust-rugpull | 17 |
| classes | read-only-reentrancy | 8 |
| classes | repeatable-withdrawal | 8 |
| classes | rounding | 9 |
| classes | signature | 4 |
| classes | solvency | 8 |
| classes | state-variable-shadowing | 9 |
| classes | strict-balance-equality | 10 |
| classes | timestamp-dependence | 1 |
| classes | token-hooks | 4 |
| classes | transaction-order | 2 |
| classes | tx-origin-auth | 2 |
| classes | unchecked-call | 2 |
| classes | uninitialized-storage-pointer | 10 |
| classes | unprotected-initializer | 6 |
| classes | unprotected-selfdestruct | 7 |
| classes | upgrade-storage-collision | 24 |
| classes | vault-inflation | 4 |
| classes | weak-randomness | 8 |
