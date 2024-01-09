# ICloner
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/ICloner.sol)


## Functions
### setImplement

Changes the contract's implementation address


```solidity
function setImplement(address implement_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`implement_`|`address`|The new implementation address|


### implement

Returns the contract's implementation address


```solidity
function implement() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The implementation address|


### allClonesOf

Returns all cloned contract instances of the given implementation
address


```solidity
function allClonesOf(address implement_)
    external
    view
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


## Events
### Cloned

```solidity
event Cloned(
    address indexed cloner,
    address implement,
    address indexed clone,
    bytes32 indexed salt
);
```

### ImplementChanged

```solidity
event ImplementChanged(address indexed from, address indexed to);
```

