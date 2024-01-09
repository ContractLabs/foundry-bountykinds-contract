# IMultiLevelReferralUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/interfaces/IMultiLevelReferralUpgradeable.sol)


## Functions
### referrerOf

*Returns the referrer information of an account*


```solidity
function referrerOf(address account_) external view returns (Referrer memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|Account address to retrieve referrer information for|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`Referrer`|Referrer information of the account|


## Events
### ReferralAdded
*Emits when a referral is added*


```solidity
event ReferralAdded(address indexed referrer, address indexed referree);
```

### LevelUpdated
*Emits when the level of an account is updated*


```solidity
event LevelUpdated(address indexed account, uint256 indexed level);
```

## Errors
### MultiLevelReferral__ProxyNotAllowed

```solidity
error MultiLevelReferral__ProxyNotAllowed();
```

### MultiLevelReferral__ReferralExisted

```solidity
error MultiLevelReferral__ReferralExisted();
```

### MultiLevelReferral__InvalidArguments

```solidity
error MultiLevelReferral__InvalidArguments();
```

### MultiLevelReferral__CircularRefUnallowed

```solidity
error MultiLevelReferral__CircularRefUnallowed();
```

## Structs
### Referrer

```solidity
struct Referrer {
    uint8 level;
    uint88 bonus;
    address addr;
}
```

