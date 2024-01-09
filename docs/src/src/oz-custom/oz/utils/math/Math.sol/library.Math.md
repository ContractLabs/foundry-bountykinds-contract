# Math
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/math/Math.sol)

*Standard math utilities missing in the Solidity language.*


## Functions
### max

*Returns the largest of two numbers.*


```solidity
function max(uint256 a, uint256 b) internal pure returns (uint256);
```

### min

*Returns the smallest of two numbers.*


```solidity
function min(uint256 a, uint256 b) internal pure returns (uint256);
```

### average

*Returns the average of two numbers. The result is rounded towards
zero.*


```solidity
function average(uint256 a, uint256 b) internal pure returns (uint256);
```

### ceilDiv

*Returns the ceiling of the division of two numbers.
This differs from standard division with `/` in that it rounds up instead
of rounding down.*


```solidity
function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256);
```

### mulDiv

Calculates floor(x * y / denominator) with full precision. Throws
if result overflows a uint256 or
denominator == 0

*Original credit to Remco Bloemen under MIT license
(https://xn--2-umb.com/21/muldiv)
with further edits by Uniswap Labs also under MIT license.*


```solidity
function mulDiv(
    uint256 x,
    uint256 y,
    uint256 denominator
)
    internal
    pure
    returns (uint256 result);
```

### mulDiv

Calculates x * y / denominator with full precision, following the
selected rounding direction.


```solidity
function mulDiv(
    uint256 x,
    uint256 y,
    uint256 denominator,
    Rounding rounding
)
    internal
    pure
    returns (uint256);
```

### sqrt

*Returns the square root of a number. It the number is not a perfect
square, the value is rounded down.
Inspired by Henry S. Warren, Jr.'s "Hacker's Delight" (Chapter 11).*


```solidity
function sqrt(uint256 a) internal pure returns (uint256);
```

### sqrt

Calculates sqrt(a), following the selected rounding direction.


```solidity
function sqrt(uint256 a, Rounding rounding) internal pure returns (uint256);
```

## Enums
### Rounding

```solidity
enum Rounding {
    Down,
    Up,
    Zero
}
```

