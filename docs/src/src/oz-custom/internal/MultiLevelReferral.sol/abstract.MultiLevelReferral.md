# MultiLevelReferral
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/MultiLevelReferral.sol)

**Inherits:**
[ProxyChecker](/src/oz-custom/internal/ProxyChecker.sol/abstract.ProxyChecker.md), [IMultiLevelReferral](/src/oz-custom/internal/interfaces/IMultiLevelReferral.sol/interface.IMultiLevelReferral.md)

**Author:**
Tu Do

*Abstract contract for a multi-level referral system*

*When a user is referred, their referrer is set and their level is
updated*

*Referrers are rewarded a percentage of the amount spent by their
referree*

*Referral bonuses are only rewarded to active referrers*


## State Variables
### PERCENTAGE_FRACTION

```solidity
uint256 public constant PERCENTAGE_FRACTION = 10_000;
```


### activeTimestampThreshold
*Timestamp threshold for an account to be considered active*


```solidity
uint256 public immutable activeTimestampThreshold;
```


### ratePerTier
*Percentage of amount spent by referree that is rewarded to referrer*

*Each element in the array corresponds to the referral rate per level*


```solidity
uint16[] public ratePerTier;
```


### __referrals
*Map of referree addresses to their referral information*


```solidity
mapping(address => Referrer) private __referrals;
```


### lastActiveTimestamp
*Map of account addresses to their last active timestamp*


```solidity
mapping(address => uint64) public lastActiveTimestamp;
```


## Functions
### constructor

*Constructor that initializes the activeTimestampThreshold and
ratePerTier values*

*The sum of the ratePerTier values must equal to 10,000*


```solidity
constructor(
    uint64 activeTimestampThreshold_,
    uint16[] memory ratePerTier_
)
    payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`activeTimestampThreshold_`|`uint64`|Timestamp threshold for an account to be considered active|
|`ratePerTier_`|`uint16[]`|Percentage of amount spent by referree that is rewarded to referrer for each level|


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


### _addReferrer

*Sets the referrer of an account and updates their referral level*

*Referree must not be a proxy contract*

*Referree must not already have a referrer*

*Referrer must not be the same as the referree to prevent circular
referrals*

*If the referrer of the referrer is the same as the referree, the
transaction reverts*


```solidity
function _addReferrer(address referrer_, address referree_) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`referrer_`|`address`|Referrer address|
|`referree_`|`address`|Referree address|


### _updateReferrerBonuses

*Updates the bonuses of all referrers for the given referree*


```solidity
function _updateReferrerBonuses(address referree_, uint256 amount_) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`referree_`|`address`|Address of the referree|
|`amount_`|`uint256`|Amount of reward that the referree received|


### _isAccountActiveLately

*Returns whether the given account has been active recently*


```solidity
function _isAccountActiveLately(address account_)
    internal
    view
    virtual
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|Account to check for recent activity|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the given account has been active recently, false otherwise|


### _updateLastActiveTimestamp

*Updates the last active timestamp for the given account*


```solidity
function _updateLastActiveTimestamp(address account_) internal;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|Account to update the last active timestamp for|


