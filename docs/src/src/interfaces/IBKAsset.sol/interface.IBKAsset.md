# IBKAsset
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IBKAsset.sol)

*This interface defines the methods and events for a contract that
manages a ERC20 token and allows executing
calls to external contracts.*


## Functions
### typeIdTrackers

*Retrieves the type ID tracker for a given type ID.*


```solidity
function typeIdTrackers(uint256 typeId_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The type ID for which to retrieve the tracker.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The type ID tracker.|


### metadataOf

*Retrieves metadata for a given token ID, including its type ID and
index.*


```solidity
function metadataOf(uint256 tokenId_)
    external
    view
    returns (uint256 typeId, uint256 index);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId_`|`uint256`|The token ID for which to retrieve metadata.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`typeId`|`uint256`|index The type ID and index of the specified token.|
|`index`|`uint256`||


