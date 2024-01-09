# BitMap256
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/structs/BitMap256.sol)

*A library for storing a bitmap of 256 slots, where each slot is
represented by a single bit. This allows for
efficient storage and manipulation of large amounts of boolean data.*


## Functions
### index

*Calculate the index for a given value in the bitmap.*


```solidity
function index(
    uint256 value_,
    bool shouldHash_
)
    internal
    pure
    returns (uint256 idx);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`idx`|`uint256`|The calculated index for the given value.|


### get

*Get the value of a bit at a given index in the bitmap.*


```solidity
function get(
    BitMap storage bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal
    view
    returns (bool isSet);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`BitMap`|The storage bitmap to get the value from.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isSet`|`bool`|A boolean indicating if the bit at the given index is set.|


### get

*Get the value of a bit at a given index in the bitmap.*


```solidity
function get(
    uint256 bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal
    pure
    returns (bool isSet);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`uint256`|The storage bitmap to get the value from.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`isSet`|`bool`|A boolean indicating if the bit at the given index is set.|


### setData

*Set the data of the storage bitmap to a given value.*


```solidity
function setData(BitMap storage bitmap_, uint256 value) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`BitMap`|The storage bitmap to set the data of.|
|`value`|`uint256`|The value to set the data of the bitmap to.|


### setTo

*Set or unset the bit at a given index in the bitmap based on the
status flag.*


```solidity
function setTo(
    BitMap storage bitmap_,
    uint256 value_,
    bool shouldHash_,
    bool status_
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`BitMap`|The storage bitmap to set or unset the bit in.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|
|`status_`|`bool`|A boolean flag indicating if the bit should be set or unset.|


### set

*Sets the bit at the given index in the bitmap to the given value.
If `shouldHash_` is `true`, the value is hashed before computing the
index.*


```solidity
function set(
    BitMap storage bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`BitMap`|The bitmap to set the bit in.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|


### set

*Sets the bit at the given index in the bitmap to the given value.
If `shouldHash_` is `true`, the value is hashed before computing the
index.*


```solidity
function set(
    uint256 bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal
    pure
    returns (uint256 bitmap);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`uint256`|The bitmap to set the bit in.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|


### unset

*Unsets the bit at the given index in the bitmap to the given value.
If `shouldHash_` is `true`, the value is hashed before computing the
index.*


```solidity
function unset(
    BitMap storage bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`BitMap`|The bitmap to set the bit in.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|


### unset

*Unsets the bit at the given index in the bitmap to the given value.
If `shouldHash_` is `true`, the value is hashed before computing the
index.*


```solidity
function unset(
    uint256 bitmap_,
    uint256 value_,
    bool shouldHash_
)
    internal
    pure
    returns (uint256 bitmap);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`bitmap_`|`uint256`|The bitmap to set the bit in.|
|`value_`|`uint256`|The value for which the index needs to be calculated.|
|`shouldHash_`|`bool`|A boolean flag indicating if the value should be hashed.|


## Structs
### BitMap
*Struct for holding a 256-bit bitmap.*


```solidity
struct BitMap {
    uint256 data;
}
```

