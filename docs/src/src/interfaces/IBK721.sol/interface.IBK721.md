# IBK721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IBK721.sol)

**Inherits:**
[IBKAsset](/src/interfaces/IBKAsset.sol/interface.IBKAsset.md)


## Functions
### exchangeAssets

*Executes an exchange of assets, swapping BK721 tokens for another
asset type.*


```solidity
function exchangeAssets(
    IBK721 forNFT_,
    uint256 forAmount_,
    uint256 forTypeId_,
    uint256 nonce_,
    uint256 deadline_,
    uint256[] calldata myIds_,
    bytes calldata signature_
)
    external
    returns (uint256[] memory forIds);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`forNFT_`|`IBK721`|The BK721 contract for the NFTs to exchange.|
|`forAmount_`|`uint256`|The amount of BK721 tokens to exchange.|
|`forTypeId_`|`uint256`|The type ID of the tokens to receive in exchange.|
|`nonce_`|`uint256`|The nonce to prevent replay attacks.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`myIds_`|`uint256[]`|An array of IDs to be exchanged.|
|`signature_`|`bytes`|The signature for authentication.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`forIds`|`uint256[]`|An array of IDs received in exchange.|


### redeemBulk

*Redeems a bulk amount of a specific asset type.*


```solidity
function redeemBulk(
    uint256 nonce_,
    uint256 amount_,
    uint256 typeId_,
    address claimer_,
    uint256 deadline_,
    bytes calldata signature_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`nonce_`|`uint256`|The nonce to prevent replay attacks.|
|`amount_`|`uint256`|The amount to redeem.|
|`typeId_`|`uint256`|The type ID of the asset to redeem.|
|`claimer_`|`address`|The address claiming the redeemed assets.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`signature_`|`bytes`|The signature for authentication.|


### transferBatch

*Transfers a batch of tokens from one address to multiple recipients.*


```solidity
function transferBatch(
    address from_,
    address[] calldata tos_,
    uint256[] calldata tokenIds_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`from_`|`address`|The address from which the tokens will be transferred.|
|`tos_`|`address[]`|An array of recipient addresses.|
|`tokenIds_`|`uint256[]`|An array of token IDs to be transferred.|


### mint

*Mints a single token and assigns it to a specified address.*


```solidity
function mint(
    address to_,
    uint256 tokenId_
)
    external
    returns (uint256 tokenId);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address to which the minted token will be assigned.|
|`tokenId_`|`uint256`|The unique ID of the minted token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|The unique ID of the minted token.|


### safeMint

*Safely mints a single token of a specified type and assigns it to a
specified address.*


```solidity
function safeMint(
    address to_,
    uint256 typeId_
)
    external
    returns (uint256 tokenId);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address to which the minted token will be assigned.|
|`typeId_`|`uint256`|The type ID of the minted token.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|The unique ID of the minted token.|


### mintBatch

*Mints multiple tokens of the same type and assigns them to multiple
addresses.*


```solidity
function mintBatch(uint256 typeId_, address[] calldata tos_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The type ID of the minted tokens.|
|`tos_`|`address[]`|An array of addresses to which the minted tokens will be assigned.|


### safeMintBatch

*Safely mints multiple tokens of the same type and assigns them to a
specified address.*


```solidity
function safeMintBatch(
    address to_,
    uint256 typeId_,
    uint256 length_
)
    external
    returns (uint256[] memory tokenIds);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address to which the minted tokens will be assigned.|
|`typeId_`|`uint256`|The type ID of the minted tokens.|
|`length_`|`uint256`|The number of tokens to mint.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`tokenIds`|`uint256[]`|An array of unique IDs for the minted tokens.|


### merge

*Merges multiple tokens into a single token.*


```solidity
function merge(
    uint256[] calldata fromIds_,
    uint256 toId_,
    uint256 deadline_,
    bytes calldata signature_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`fromIds_`|`uint256[]`|An array of IDs to merge.|
|`toId_`|`uint256`|The ID of the token to merge into.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`signature_`|`bytes`|The signature for authentication.|


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


### nonceBitMaps

*Retrieves the nonce bitmap for a specific account and nonce value.*


```solidity
function nonceBitMaps(
    address account_,
    uint256 nonce_
)
    external
    view
    returns (uint256 bitmap, bool isDirtied);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address of the account.|
|`nonce_`|`uint256`|The nonce value.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`bitmap`|`uint256`|The nonce bitmap.|
|`isDirtied`|`bool`|A boolean indicating whether the nonce bitmap is dirtied.|


### invalidateNonce

*Invalidates a specific nonce for a given account.*


```solidity
function invalidateNonce(
    address account_,
    uint248 wordPos_,
    uint256 mask_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address of the account.|
|`wordPos_`|`uint248`|The position of the word in the bitmap.|
|`mask_`|`uint256`|The mask to invalidate the nonce.|


### nextIdFromType

*Retrieves the next available ID for tokens of a specific type.*


```solidity
function nextIdFromType(uint256 typeId_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The type ID.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The next available token ID for the specified type.|


### baseURI

*Retrieves the base URI for token metadata.*


```solidity
function baseURI() external view returns (string memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`string`|The base URI.|


### setBaseURI

*Sets the base URI for token metadata.*


```solidity
function setBaseURI(string calldata baseURI_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`baseURI_`|`string`|The new base URI.|


## Events
### Exchanged
*Emitted when tokens are exchanged between two users.*


```solidity
event Exchanged(
    address indexed sender,
    IBK721 indexed forNFT,
    uint256 indexed forTypeId,
    uint256 forAmount,
    uint256[] senderNFTIds
);
```

### Merged
*Emitted when two or more NFTs are merged into a single NFT.*


```solidity
event Merged(address indexed account, uint256[] from, uint256 to);
```

### Redeemded
*Emitted when tokens are redeemed by a user.*


```solidity
event Redeemded(
    address indexed operator,
    address indexed claimer,
    uint256 indexed typeId,
    uint256 amount
);
```

### BatchMinted
*Emitted when tokens are minted in bulk by an operator.*


```solidity
event BatchMinted(
    address indexed operator, uint256 indexed amount, address[] tos
);
```

### BatchTransfered
*Emitted when tokens are transferred in bulk from one user to
multiple users.*


```solidity
event BatchTransfered(
    address indexed operator, address indexed from, uint256 indexed nextId
);
```

## Errors
### BK721__Expired
*Throws if the exchange request has already expired.*


```solidity
error BK721__Expired();
```

### BK721__Unauthorized
*Throws if the exchange request is not authorized.*


```solidity
error BK721__Unauthorized();
```

### BK721__LengthMismatch
*Throws if the length of an array does not match the expected length.*


```solidity
error BK721__LengthMismatch();
```

### BK721__ExecutionFailed
*Throws if an execution fails.*


```solidity
error BK721__ExecutionFailed();
```

### BK721__InvalidSignature
*Throws if the signature is invalid.*


```solidity
error BK721__InvalidSignature();
```

### BK721__TokenNotSupported
*Throws if the token is not supported.*


```solidity
error BK721__TokenNotSupported();
```

