# BlacklistableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/BlacklistableUpgradeable.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [IBlacklistableUpgradeable](/src/oz-custom/internal-upgradeable/interfaces/IBlacklistableUpgradeable.sol/interface.IBlacklistableUpgradeable.md)

*Abstract contract that provides blacklist functionality.
Users of this contract can add or remove an address from the blacklist.
Users can check if an address is blacklisted.*


## State Variables
### __blacklisted

```solidity
BitMapsUpgradeable.BitMap private __blacklisted;
```


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### isBlacklisted

*Check if an address is blacklisted.*


```solidity
function isBlacklisted(address account_) public view virtual returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to check.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the address is blacklisted, false otherwise.|


### areBlacklisted


```solidity
function areBlacklisted(address[] calldata accounts_)
    public
    view
    virtual
    returns (bool);
```

### _setUserStatus

*Internal function to set the status of an account.*


```solidity
function _setUserStatus(address account_, bool status_) internal virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to change the status of.|
|`status_`|`bool`|The new status for the address. True for blacklisted, false for not blacklisted.|


