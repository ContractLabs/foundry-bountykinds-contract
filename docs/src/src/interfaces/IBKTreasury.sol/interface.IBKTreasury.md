# IBKTreasury
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IBKTreasury.sol)

*Interface for interacting with the BKTreasury contract, which manages
payments and prices.*


## Functions
### priceOf

*Retrieves the price of a specified token.*


```solidity
function priceOf(address token_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The address of the token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The current price of the token.|


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


## Events
### PaymentsUpdated
*Emitted when payments are updated by the operator.*


```solidity
event PaymentsUpdated(
    address indexed operator, address[] payments, bool[] statuses
);
```

### PricesUpdated
*Emitted when token prices are updated by the operator.*


```solidity
event PricesUpdated(
    address indexed operator, address[] tokens, uint256[] prices
);
```

## Errors
### BKTreasury__LengthMismatch

```solidity
error BKTreasury__LengthMismatch();
```

### BKTreasury__UnsupportedToken

```solidity
error BKTreasury__UnsupportedToken();
```

