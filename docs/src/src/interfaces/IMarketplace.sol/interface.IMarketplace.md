# IMarketplace
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IMarketplace.sol)

*Interface for the Marketplace contract, managing marketplace-related
functionalities.*


## Functions
### nonces

*Retrieves the nonce associated with a specific account.*


```solidity
function nonces(address account_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address of the account.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The nonce value for the account.|


### setProtocolFee

*Sets the protocol fee fraction for the marketplace.*


```solidity
function setProtocolFee(uint256 feeFraction_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`feeFraction_`|`uint256`|The fraction of the transaction amount to be charged as a protocol fee.|


### redeem

*Redeems an NFT from the marketplace.*


```solidity
function redeem(
    uint256 deadline_,
    Buyer calldata buyer_,
    Seller calldata seller_,
    bytes calldata signature_
)
    external
    payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`buyer_`|`Buyer`|The buyer's information for the transaction.|
|`seller_`|`Seller`|The seller's information for the listing.|
|`signature_`|`bytes`|The signature for authentication.|


## Events
### ProtocolFeeUpdated

```solidity
event ProtocolFeeUpdated(address indexed operator, uint256 indexed feeFraction);
```

### Redeemed

```solidity
event Redeemed(
    address indexed buyer, address indexed seller, Seller sellerItem
);
```

### TokensWhitelisted

```solidity
event TokensWhitelisted(address indexed operator, address[] tokens);
```

## Errors
### Marketplace__Expired

```solidity
error Marketplace__Expired();
```

### Marketplace__UnsupportedNFT

```solidity
error Marketplace__UnsupportedNFT();
```

### Marketplace__ExecutionFailed

```solidity
error Marketplace__ExecutionFailed();
```

### Marketplace__InvalidSignature

```solidity
error Marketplace__InvalidSignature();
```

### Marketplace__UnsupportedPayment

```solidity
error Marketplace__UnsupportedPayment();
```

## Structs
### Seller
*Represents a seller's information for a marketplace listing.*


```solidity
struct Seller {
    uint256 tokenId;
    uint256 deadline;
    uint256 unitPrice;
    address payment;
    IERC721PermitUpgradeable nft;
    bytes signature;
}
```

### Buyer
*Represents a buyer's information for a marketplace transaction.*


```solidity
struct Buyer {
    uint8 v;
    bytes32 r;
    bytes32 s;
    uint256 deadline;
}
```

