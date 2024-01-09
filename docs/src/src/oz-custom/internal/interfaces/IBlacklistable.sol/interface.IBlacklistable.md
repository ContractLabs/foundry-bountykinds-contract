# IBlacklistable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/IBlacklistable.sol)


## Functions
### setUserStatus

*Set the status of an account to either blacklisted or not
blacklisted.*


```solidity
function setUserStatus(address account_, bool status) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to change the status of.|
|`status`|`bool`|The new status for the address. True for blacklisted, false for not blacklisted.|


### isBlacklisted

*Check if an address is blacklisted.*


```solidity
function isBlacklisted(address account_) external view returns (bool);
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
    external
    view
    returns (bool);
```

## Events
### UserStatusSet

```solidity
event UserStatusSet(
    address indexed operator,
    address indexed account,
    bool indexed isBlacklisted
);
```

