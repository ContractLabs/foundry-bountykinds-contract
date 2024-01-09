# IERC721Rentable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/IERC721Rentable.sol)

**Inherits:**
[IERC721](/src/oz-custom/oz/token/ERC721/IERC721.sol/interface.IERC721.md)


## Functions
### setUser

set the user and expires of an NFT

*The zero address indicates there is no user
Throws if `tokenId` is not valid NFT*


```solidity
function setUser(uint256 tokenId, address user, uint64 expires) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`||
|`user`|`address`| The new user of the NFT|
|`expires`|`uint64`| UNIX timestamp, The new user could use the NFT before expires|


### userOf

Get the user address of an NFT

*The zero address indicates that there is no user or the user is
expired*


```solidity
function userOf(uint256 tokenId) external view returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|The NFT to get the user address for|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|The user address for this NFT|


### userExpires

Get the user expires of an NFT

*The zero value indicates that there is no user*


```solidity
function userExpires(uint256 tokenId) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|The NFT to get the user expires for|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The user expires for this NFT|


## Events
### UpdateUser
Emitted when the `user` of an NFT or the `expires` of the `user`
is changed
The zero address for user indicates that there is no user address


```solidity
event UpdateUser(uint256 indexed tokenId, address indexed user, uint64 expires);
```

## Errors
### ERC721Rentable__NotValidTransfer

```solidity
error ERC721Rentable__NotValidTransfer();
```

### ERC721Rentable__OnlyOwnerOrApproved

```solidity
error ERC721Rentable__OnlyOwnerOrApproved();
```

## Structs
### UserInfo

```solidity
struct UserInfo {
    address user;
    uint96 expires;
}
```

