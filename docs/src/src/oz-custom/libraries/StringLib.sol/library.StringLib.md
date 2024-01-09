# StringLib
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/StringLib.sol)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/utils/LibString.sol), Modified from Solady
(https://github.com/Vectorized/solady/blob/main/src/utils/LibString.sol)

Efficient library for creating string representations of integers.


## State Variables
### __ADDRESS_LENGTH

```solidity
uint256 private constant __ADDRESS_LENGTH = 20;
```


### __SYMBOLS

```solidity
bytes32 private constant __SYMBOLS = "0123456789abcdef";
```


## Functions
### toString


```solidity
function toString(int256 value) internal pure returns (string memory str);
```

### log256

*Return the log in base 256, rounded down, of a positive value.
Returns 0 if given 0.
Adding one to the result gives the number of pairs of hex symbols needed
to represent `value` as a hex string.*


```solidity
function log256(uint256 value) internal pure returns (uint256);
```

### toHexString

*Converts a `uint256` to its ASCII `string` hexadecimal
representation.*


```solidity
function toHexString(uint256 value) internal pure returns (string memory);
```

### toHexString

*Converts a `uint256` to its ASCII `string` hexadecimal
representation with fixed length.*


```solidity
function toHexString(
    uint256 value,
    uint256 length
)
    internal
    pure
    returns (string memory);
```

### toHexString

*Converts an `address` with fixed length of 20 bytes to its not
checksummed ASCII `string` hexadecimal
representation.*


```solidity
function toHexString(address addr) internal pure returns (string memory);
```

### toString


```solidity
function toString(uint256 value) internal pure returns (string memory str);
```

