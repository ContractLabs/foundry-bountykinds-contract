# IINO
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IINO.sol)

*Interface for the Initial NFT Offering (INO) contract, managing
INO-related functionalities.*


## Functions
### ticketId

*Calculates the ID of a ticket for a specific campaign and amount.*


```solidity
function ticketId(
    uint64 campaignId_,
    uint32 amount_
)
    external
    pure
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint64`|The ID of the campaign.|
|`amount_`|`uint32`|The amount of NFTs in the ticket.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The calculated ticket ID.|


### redeem

*Redeems an INO ticket for a specific user.*


```solidity
function redeem(
    address user_,
    address token_,
    uint256 value_,
    uint256 ticketId_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user redeeming the ticket.|
|`token_`|`address`|The payment token used for redemption.|
|`value_`|`uint256`|The value of the payment token.|
|`ticketId_`|`uint256`|The ID of the INO ticket.|


### setCampaign

*Sets the details of a specific INO campaign.*


```solidity
function setCampaign(
    uint256 campaignId_,
    Campaign calldata campaign_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|
|`campaign_`|`Campaign`|The details of the campaign.|


### paymentOf

*Retrieves the supported payment tokens for a specific campaign.*


```solidity
function paymentOf(uint256 campaignId_)
    external
    view
    returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|An array of supported payment tokens.|


### campaign

*Retrieves the details of a specific INO campaign.*


```solidity
function campaign(uint256 campaignId_)
    external
    view
    returns (Campaign memory campaign_);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`campaign_`|`Campaign`|The details of the campaign.|


## Events
### Registered
*Emitted when a user registers for an Initial NFT Offering (INO)
campaign.*


```solidity
event Registered(
    address indexed user,
    address indexed erc721,
    uint256[] tokenIds,
    uint256 price
);
```

### Redeemed
*Emitted when a user redeems an INO ticket.*


```solidity
event Redeemed(
    address indexed buyer,
    uint256 indexed ticketId,
    address indexed paymentToken,
    uint256 total
);
```

### Received
*Emitted when an address receives an NFT.*


```solidity
event Received(
    address indexed from,
    address indexed to,
    uint256 indexed tokenId,
    bytes data
);
```

### NewCampaign
*Emitted when a new INO campaign is initiated.*


```solidity
event NewCampaign(
    uint256 indexed campaignId, uint64 indexed startAt, uint64 indexed endAt
);
```

## Errors
### INO__Unauthorized

```solidity
error INO__Unauthorized();
```

### INO__OnGoingCampaign

```solidity
error INO__OnGoingCampaign();
```

### INO__InsuficcientAmount

```solidity
error INO__InsuficcientAmount();
```

### INO__AllocationExceeded

```solidity
error INO__AllocationExceeded();
```

### INO__ExternalCallFailed

```solidity
error INO__ExternalCallFailed();
```

### INO__UnsupportedPayment

```solidity
error INO__UnsupportedPayment(address);
```

### INO__CampaignEndedOrNotYetStarted

```solidity
error INO__CampaignEndedOrNotYetStarted();
```

## Structs
### Campaign
*Represents a campaign for an Initial NFT Offering.*


```solidity
struct Campaign {
    uint64 start;
    uint32 limit;
    address nft;
    uint64 end;
    uint64 maxSupply;
    uint128 typeNFT;
    uint96 usdPrice;
    address[] payments;
}
```

### Ticket
*Represents a ticket for the Initial NFT Offering.*


```solidity
struct Ticket {
    address paymentToken;
    uint256 campaignId;
    uint256 amount;
}
```

