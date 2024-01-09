# SafeCastUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/utils/math/SafeCastUpgradeable.sol)

*Wrappers over Solidity's uintXX/intXX casting operators with added
overflow
checks.
Downcasting from uint256/int256 in Solidity does not revert on overflow. This
can
easily result in undesired exploitation or bugs, since developers usually
assume that overflows raise errors. `SafeCast` restores this intuition by
reverting the transaction when such an operation overflows.
Using this library instead of the unchecked operations eliminates an entire
class of bugs, so it's recommended to use it always.
Can be combined with {SafeMath} and {SignedSafeMath} to extend it to smaller
types, by performing
all math on `uint256` and `int256` and then downcasting.*


## Functions
### toUint96

*Returns the downcasted uint248 from uint256, reverting on
overflow (when the input is greater than largest uint248).
Counterpart to Solidity's `uint248` operator.
Requirements:
- input must fit into 248 bits
_Available since v4.7._*

*Returns the downcasted uint96 from uint256, reverting on
overflow (when the input is greater than largest uint96).
Counterpart to Solidity's `uint96` operator.
Requirements:
- input must fit into 96 bits
_Available since v4.2._*


```solidity
function toUint96(uint256 value) internal pure returns (uint96);
```

