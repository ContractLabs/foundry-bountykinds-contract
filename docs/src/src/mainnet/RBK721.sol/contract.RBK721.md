# RBK721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/RBK721.sol)

**Inherits:**
[BK721](/src/mainnet/BK721.sol/abstract.BK721.md), [IRBK721](/src/interfaces/IRBK721.sol/interface.IRBK721.md), [ERC721RentableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721RentableUpgradeable.sol/abstract.ERC721RentableUpgradeable.md)


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    string calldata name_,
    string calldata symbol_,
    string calldata baseURI_,
    uint96 feeAmt_,
    address feeToken_,
    IAuthority authority_
)
    external
    initializer;
```

### setUser

*Allows a user to rent an RBK721 token by setting user-specific
information.*


```solidity
function setUser(
    address user_,
    uint256 tokenId,
    uint64 expires_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    whenNotPaused
    whenUseSignature(deadline_);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user renting the RBK721 token.|
|`tokenId`|`uint256`|The ID of the RBK721 token to be rented.|
|`expires_`|`uint64`|The timestamp indicating the expiration of the user's rental period.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`signature_`|`bytes`|The signature for authentication.|


### setUser

*value is equal to keccak256("Permit(address
user,uint256 tokenId,uint256 expires,uint256
deadline,uint256 nonce)")*

*value is equal to
keccak256("UpdateUser(uint256,address,uint64)")*


```solidity
function setUser(
    uint256 tokenId_,
    address user_,
    uint64 expires_
)
    public
    override
    whenNotPaused;
```

### fixTokenIdTrackers

*value is equal to
keccak256("UpdateUser(uint256,address,uint64)")*

*Fixes the token ID trackers for a specific type after mintBatch
if the result of typeIdTrackers indicates that a tokenId was minted.*


```solidity
function fixTokenIdTrackers(
    uint256 typeId_,
    uint256 value_
)
    public
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The type ID to fix the trackers for.|
|`value_`|`uint256`|The new value to set for the trackers.|


### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    override(BK721, ERC721RentableUpgradeable)
    returns (bool);
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 tokenId_,
    uint256 batchSize_
)
    internal
    override(BK721, ERC721RentableUpgradeable);
```

