# FixedPointMathLib
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/FixedPointMathLib.sol)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/utils/FixedPointMathLib.sol), Inspired by USM
(https://github.com/usmfum/USM/blob/master/contracts/WadMath.sol)

Arithmetic library with operations for fixed-point numbers.


## State Variables
### MAX_UINT256

```solidity
uint256 internal constant MAX_UINT256 = (1 << 256) - 1;
```


### WAD

```solidity
uint256 internal constant WAD = 1e18;
```


## Functions
### mulWadDown


```solidity
function mulWadDown(uint256 x, uint256 y) internal pure returns (uint256);
```

### mulWadUp


```solidity
function mulWadUp(uint256 x, uint256 y) internal pure returns (uint256);
```

### divWadDown


```solidity
function divWadDown(uint256 x, uint256 y) internal pure returns (uint256);
```

### divWadUp


```solidity
function divWadUp(uint256 x, uint256 y) internal pure returns (uint256);
```

### mulDivDown


```solidity
function mulDivDown(
    uint256 x,
    uint256 y,
    uint256 denominator
)
    internal
    pure
    returns (uint256 z);
```

### mulDivUp


```solidity
function mulDivUp(
    uint256 x,
    uint256 y,
    uint256 denominator
)
    internal
    pure
    returns (uint256 z);
```

### rpow


```solidity
function rpow(
    uint256 x,
    uint256 n,
    uint256 scalar
)
    internal
    pure
    returns (uint256 z);
```

### sqrt


```solidity
function sqrt(uint256 x) internal pure returns (uint256 z);
```

