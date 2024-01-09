# SigUtil
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/SigUtil.sol)


## Functions
### merge

*Merges the ECDSA values into a single signature bytes*


```solidity
function merge(
    uint8 v,
    bytes32 r,
    bytes32 s
)
    internal
    pure
    returns (bytes memory signature);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`v`|`uint8`|ECDSA recovery value|
|`r`|`bytes32`|ECDSA r value|
|`s`|`bytes32`|ECDSA s value|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`signature`|`bytes`|Combined signature bytes|


### split

*Splits the signature bytes into ECDSA values*


```solidity
function split(bytes calldata signature_)
    internal
    pure
    returns (bytes32 r, bytes32 s, uint8 v);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`signature_`|`bytes`|Signature bytes to split|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`r`|`bytes32`|s v Tuple of ECDSA values|
|`s`|`bytes32`||
|`v`|`uint8`||


