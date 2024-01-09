# BKTreasury
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BKTreasury.sol)

**Inherits:**
[TreasuryUpgradeable](/src/oz-custom/presets-upgradeable/TreasuryUpgradeable.sol/abstract.TreasuryUpgradeable.md), [IBKTreasury](/src/interfaces/IBKTreasury.sol/interface.IBKTreasury.md)


## State Variables
### priceFeed

```solidity
AggregatorV3Interface public priceFeed;
```


### __priceOf

```solidity
mapping(address => uint256) private __priceOf;
```


### __supportedPayments

```solidity
EnumerableSet.AddressSet private __supportedPayments;
```


### limitTokenPerUser

```solidity
mapping(address account => uint256 configuredTimestamp) public limitTokenPerUser;
```


### limitTokenPerDay

```solidity
mapping(address token => uint256 configuredTimestamp) public limitTokenPerDay;
```


### tokenWithdrawedAmountPerDay

```solidity
mapping(address token => mapping(uint256 configuredTimestamp => uint256)) public
    tokenWithdrawedAmountPerDay;
```


### userWithdrawedAmountPerDay

```solidity
mapping(
    address token
        => mapping(
            address account => mapping(uint256 configuredTimestamp => uint256)
        )
) public userWithdrawedAmountPerDay;
```


### ADMIN

```solidity
bytes32 private constant ADMIN =
    0x0000000000000000000000000000000000000000000000000000000000000000;
```


### __gap

```solidity
uint256[43] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    string calldata name_,
    IAuthority authority_,
    AggregatorV3Interface priceFeed_
)
    external
    initializer;
```

### updatePrices

*Updates the prices of specified tokens and adds them to the list of
supported payments.
Only accessible by users with the TREASURER_ROLE.*


```solidity
function updatePrices(
    address[] calldata tokens_,
    uint256[] calldata prices_
)
    external
    onlyRole(Roles.TREASURER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokens_`|`address[]`|An array of token addresses to update.|
|`prices_`|`uint256[]`|An array of corresponding prices for the tokens.|


### updatePayments

*Updates the status of specified payments (add or remove) and returns
the results.
Only accessible by users with the TREASURER_ROLE.*


```solidity
function updatePayments(
    address[] calldata payments_,
    bool[] calldata statuses_
)
    external
    onlyRole(Roles.TREASURER_ROLE)
    returns (bool[] memory results);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`payments_`|`address[]`|An array of payment addresses to update.|
|`statuses_`|`bool[]`|An array of corresponding status (true for add, false for remove) for the payments.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`results`|`bool[]`|An array indicating the success status of each update operation.|


### priceOf

*Retrieves the price of a specified token.*


```solidity
function priceOf(address token_) external view returns (uint256 usdPrice);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The address of the token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`usdPrice`|`uint256`|The current price of the token.|


### supportedPayment

*Checks if a specific token is supported for payments.*


```solidity
function supportedPayment(address token_) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The address of the token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|A boolean indicating whether the token is supported.|


### viewSupportedPayments

*Retrieves an array of supported payment tokens.*


```solidity
function viewSupportedPayments() external view returns (address[] memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|An array containing addresses of supported payment tokens.|


### setLimit

*Set daily and per-user limits for a specific token.*


```solidity
function setLimit(
    address token_,
    uint256 limitPerUser_,
    uint256 limitTokenPerDay_
)
    external
    onlyRole(ADMIN);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The address of the token for which limits are set.|
|`limitPerUser_`|`uint256`|The maximum amount allowed per user in a day.|
|`limitTokenPerDay_`|`uint256`|The total daily limit for the specified token. Requirements: - The caller must have the ADMIN role.|


### _configTimestamp

*Configures a raw timestamp to the start of the day by extracting the
date
components and converting them back to a timestamp.*


```solidity
function _configTimestamp(uint256 rawTimestamp_)
    internal
    pure
    returns (uint256 configuredTimestamp);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`rawTimestamp_`|`uint256`|The original timestamp to be configured.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`configuredTimestamp`|`uint256`|The timestamp representing the start of the day.|


### _beforeWithdraw

*Performs pre-withdrawal checks and updates withdrawal records.
This internal function is called before processing a withdrawal of
tokens.
It calculates and checks withdrawal limits based on the token type,
recipient,
and withdrawal amounts. If the withdrawal exceeds the specified limits,
the function reverts with appropriate error messages.*


```solidity
function _beforeWithdraw(
    address token_,
    address to_,
    uint256 value_,
    uint256 amount_
)
    internal
    override;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The address of the token being withdrawn.|
|`to_`|`address`|The address of the recipient.|
|`value_`|`uint256`|The withdrawal value (for ERC20 tokens).|
|`amount_`|`uint256`|The withdrawal amount (for ERC1155 tokens). Requirements: - The token address must support the ERC1155 interface if `amount_` is provided. - The withdrawal amount must not exceed the daily limit for the token. - The withdrawal amount for the user must not exceed the daily limit.|


