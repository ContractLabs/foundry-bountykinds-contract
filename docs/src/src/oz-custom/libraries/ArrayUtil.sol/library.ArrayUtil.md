# ArrayUtil
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/ArrayUtil.sol)

*Utility library for working with arrays. This library contains functions
for trimming an array and removing
duplicate elements from an array by converting it to a set using a bitmap.*


## Functions
### toSet


```solidity
function toSet(uint256[] memory arr_)
    internal
    pure
    returns (uint256[] memory);
```

### trim

*Trims an array by removing all elements that match a given value.*


```solidity
function trim(
    uint256[256] storage arr_,
    uint256 trimVal_
)
    internal
    view
    returns (uint256[] memory trimmed);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`arr_`|`uint256[256]`|The input array to trim.|
|`trimVal_`|`uint256`|The value to remove from the array.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`trimmed`|`uint256[]`|An array with the specified elements removed.|


### trim

*Trims an array by removing all elements that match a given value.*


```solidity
function trim(
    uint256[] memory arr_,
    uint256 trimVal_
)
    internal
    pure
    returns (uint256[] memory trimmed);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`arr_`|`uint256[]`|The input array to trim.|
|`trimVal_`|`uint256`|The value to remove from the array.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`trimmed`|`uint256[]`|An array with the specified elements removed.|


