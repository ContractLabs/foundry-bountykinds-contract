# Bytes32Address
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/Bytes32Address.sol)


## Functions
### fromFirst20Bytes


```solidity
function fromFirst20Bytes(bytes32 bytesValue)
    internal
    pure
    returns (address addr);
```

### fillLast12Bytes


```solidity
function fillLast12Bytes(address addressValue)
    internal
    pure
    returns (bytes32 value);
```

### fromFirst160Bits


```solidity
function fromFirst160Bits(uint256 uintValue)
    internal
    pure
    returns (address addr);
```

### fillLast96Bits


```solidity
function fillLast96Bits(address addressValue)
    internal
    pure
    returns (uint256 value);
```

### fromLast160Bits


```solidity
function fromLast160Bits(uint256 uintValue)
    internal
    pure
    returns (address addr);
```

### fillFirst96Bits


```solidity
function fillFirst96Bits(address addressValue)
    internal
    pure
    returns (uint256 value);
```

