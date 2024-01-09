# IGacha
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IGacha.sol)

*Interface for the Gacha contract, handling gacha-related
functionalities.*


## Functions
### updateTicketPrice

*Updates the ticket price for a specific gacha type.*


```solidity
function updateTicketPrice(
    uint256 typeId_,
    address[] calldata supportedPayments,
    uint96[] calldata unitPrices_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The type ID of the gacha.|
|`supportedPayments`|`address[]`|An array of supported payment tokens.|
|`unitPrices_`|`uint96[]`|An array of corresponding unit prices for each payment token.|


### redeemTicket

*Redeems a gacha ticket for a specific user.*


```solidity
function redeemTicket(
    address user_,
    address token_,
    uint256 value_,
    uint256 id_,
    uint256 type_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user redeeming the ticket.|
|`token_`|`address`|The payment token used for redemption.|
|`value_`|`uint256`|The value of the payment token.|
|`id_`|`uint256`|The ID of the gacha ticket.|
|`type_`|`uint256`|The type of the gacha.|


### claimReward

*Claims a reward associated with a gacha ticket.*


```solidity
function claimReward(
    address token_,
    uint256 ticketId_,
    uint256 value_,
    uint256 deadline_,
    bytes calldata signature_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The reward token.|
|`ticketId_`|`uint256`|The ID of the gacha ticket.|
|`value_`|`uint256`|The value of the reward.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`signature_`|`bytes`|The signature for authentication.|


### nonces

*Retrieves the nonce associated with a specific gacha ticket.*


```solidity
function nonces(uint256 ticketId_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`ticketId_`|`uint256`|The ID of the gacha ticket.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The nonce value for the gacha ticket.|


## Events
### Rewarded

```solidity
event Rewarded(
    address indexed operator,
    uint256 indexed ticketId,
    address indexed token,
    uint256 value
);
```

### Redeemed

```solidity
event Redeemed(
    address indexed account, uint256 indexed ticketId, uint256 indexed typeId
);
```

### TicketPricesUpdated

```solidity
event TicketPricesUpdated(
    address indexed operator,
    uint256 indexed typeId,
    address[] supportedPayments,
    uint96[] unitPrices
);
```

## Errors
### Gacha__Expired

```solidity
error Gacha__Expired();
```

### Gacha__Unauthorized

```solidity
error Gacha__Unauthorized();
```

### Gacha__InvalidTicket

```solidity
error Gacha__InvalidTicket();
```

### Gacha__InvalidPayment

```solidity
error Gacha__InvalidPayment();
```

### Gacha__PurchasedTicket

```solidity
error Gacha__PurchasedTicket();
```

### Gacha__InvalidSignature

```solidity
error Gacha__InvalidSignature();
```

### Gacha__InsufficientAmount

```solidity
error Gacha__InsufficientAmount();
```

## Structs
### Ticket
*Represents a gacha ticket.*


```solidity
struct Ticket {
    address account;
    bool isUsed;
}
```

