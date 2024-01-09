# IncrementalMerkleTree
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/structs/IncrementalMerkleTree.sol)

*The incremental tree allows to calculate the root hash each time a leaf
is added, ensuring
the integrity of the tree.*


## State Variables
### MAX_DEPTH

```solidity
uint256 internal constant MAX_DEPTH = 32;
```


### SNARK_SCALAR_FIELD

```solidity
uint256 internal constant SNARK_SCALAR_FIELD =
    0x30644e72e131a029b85045b68181585d2833e84879b9709143e1f593f0000001;
```


## Functions
### init

*Initializes a tree.*


```solidity
function init(
    IncrementalTreeData storage self,
    uint256 depth,
    uint256 zero
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`self`|`IncrementalTreeData`||
|`depth`|`uint256`||
|`zero`|`uint256`||


### insert

*Inserts a leaf in the tree.*


```solidity
function insert(IncrementalTreeData storage self, uint256 leaf) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`self`|`IncrementalTreeData`||
|`leaf`|`uint256`||


### isKnownRoot


```solidity
function isKnownRoot(
    IncrementalTreeData storage self_,
    uint256 root_
)
    internal
    view
    returns (bool);
```

### update

*Updates a leaf in the tree.*


```solidity
function update(
    IncrementalTreeData storage self,
    uint256 leaf,
    uint256 newLeaf,
    uint256[] calldata proofSiblings,
    uint256[] calldata proofPathIndices
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`self`|`IncrementalTreeData`||
|`leaf`|`uint256`||
|`newLeaf`|`uint256`||
|`proofSiblings`|`uint256[]`||
|`proofPathIndices`|`uint256[]`||


### remove

*Removes a leaf from the tree.*


```solidity
function remove(
    IncrementalTreeData storage self,
    uint256 leaf,
    uint256[] calldata proofSiblings,
    uint256[] calldata proofPathIndices
)
    internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`self`|`IncrementalTreeData`||
|`leaf`|`uint256`||
|`proofSiblings`|`uint256[]`||
|`proofPathIndices`|`uint256[]`||


### verify

*Verify if the path is correct and the leaf is part of the tree.*


```solidity
function verify(
    IncrementalTreeData storage self,
    uint256 leaf,
    uint256[] calldata proofSiblings,
    uint256[] calldata proofPathIndices
)
    private
    view
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`self`|`IncrementalTreeData`||
|`leaf`|`uint256`||
|`proofSiblings`|`uint256[]`||
|`proofPathIndices`|`uint256[]`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True or false.|


