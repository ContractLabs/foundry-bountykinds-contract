# Cloner
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/Cloner.sol)

**Inherits:**
[ICloner](/src/oz-custom/internal/interfaces/ICloner.sol/interface.ICloner.md), [Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md)


## State Variables
### __implement

```solidity
bytes32 private __implement;
```


### __clones

```solidity
mapping(bytes32 => bytes32[]) private __clones;
```


## Functions
### constructor


```solidity
constructor(address implement_) payable;
```

### implement

Returns the contract's implementation address


```solidity
function implement() public view virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The implementation address|


### _cloneOf

Returns a cloned contract instance of the given salt


```solidity
function _cloneOf(bytes32 salt_)
    internal
    view
    virtual
    returns (address clone, bool isCloned);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`salt_`|`bytes32`|The salt used to deterministically generate the clone's address|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`clone`|`address`|isCloned The cloned contract instance, and a boolean indicating whether the contract has already been cloned|
|`isCloned`|`bool`||


### allClonesOf

Returns all cloned contract instances of the given implementation
address


```solidity
function allClonesOf(address implement_)
    external
    view
    virtual
    returns (address[] memory clones);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`implement_`|`address`|The implementation address|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`clones`|`address[]`|The array of cloned contract instances|


### _setImplement


```solidity
function _setImplement(address implement_) internal virtual;
```

### _clone

Creates a cloned contract instance of the given salt


```solidity
function _clone(
    bytes32 salt_,
    bytes4 initSelector_,
    bytes memory initCode_
)
    internal
    virtual
    returns (address clone);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`salt_`|`bytes32`|The salt used to deterministically generate the clone's address|
|`initSelector_`|`bytes4`|The optional selector for the clone's initialization function|
|`initCode_`|`bytes`|The optional data for the clone's initialization function|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`clone`|`address`|The cloned contract instance|


