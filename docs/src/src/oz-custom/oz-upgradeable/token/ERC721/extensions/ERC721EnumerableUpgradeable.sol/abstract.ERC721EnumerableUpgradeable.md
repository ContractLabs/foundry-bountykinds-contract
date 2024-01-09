# ERC721EnumerableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [IERC721EnumerableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol/interface.IERC721EnumerableUpgradeable.md)

*This implements an optional extension of {ERC721} defined in the EIP
that adds
enumerability of all the token ids in the contract as well as all token ids
owned by each
account.*


## State Variables
### __allTokens

```solidity
uint256[] private __allTokens;
```


### __allTokensIndex

```solidity
mapping(uint256 => uint256) private __allTokensIndex;
```


### __ownedTokensIndex

```solidity
mapping(uint256 => uint256) private __ownedTokensIndex;
```


### __ownedTokens

```solidity
mapping(address => mapping(uint256 => uint256)) private __ownedTokens;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[46] private __gap;
```


## Functions
### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(IERC165Upgradeable, ERC721Upgradeable)
    returns (bool);
```

### tokenOfOwnerByIndex

*See {IERC721Enumerable-tokenOfOwnerByIndex}.*


```solidity
function tokenOfOwnerByIndex(
    address owner,
    uint256 index
)
    public
    view
    virtual
    override
    returns (uint256 tokenId);
```

### totalSupply

*See {IERC721Enumerable-totalSupply}.*


```solidity
function totalSupply() public view virtual override returns (uint256 supply);
```

### tokenByIndex

*See {IERC721Enumerable-tokenByIndex}.*


```solidity
function tokenByIndex(uint256 index)
    public
    view
    virtual
    override
    returns (uint256 tokenId);
```

### _beforeTokenTransfer

*Hook that is called before any token transfer. This includes minting
and burning.
Calling conditions:
- When `from` and `to` are both non-zero, ``from``'s `tokenId` will be
transferred to `to`.
- When `from` is zero, `tokenId` will be minted for `to`.
- When `to` is zero, ``from``'s `tokenId` will be burned.
- `from` cannot be the zero address.
- `to` cannot be the zero address.
To learn more about hooks, head to
xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].*


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 firstTokenId,
    uint256 batchSize
)
    internal
    virtual
    override;
```

### _addTokenToOwnerEnumeration

*Private function to add a token to this extension's
ownership-tracking data structures.*


```solidity
function _addTokenToOwnerEnumeration(address to, uint256 tokenId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to`|`address`|address representing the new owner of the given token ID|
|`tokenId`|`uint256`|uint256 ID of the token to be added to the tokens list of the given address|


### _addTokenToAllTokensEnumeration

*Private function to add a token to this extension's token tracking
data structures.*


```solidity
function _addTokenToAllTokensEnumeration(uint256 tokenId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|uint256 ID of the token to be added to the tokens list|


### _removeTokenFromOwnerEnumeration

*Private function to remove a token from this extension's
ownership-tracking data structures. Note that
while the token is not assigned a new owner, the `_ownedTokensIndex`
mapping is _not_ updated: this allows for
gas optimizations e.g. when performing a transfer operation (avoiding
double writes).
This has O(1) time complexity, but alters the order of the _ownedTokens
array.*


```solidity
function _removeTokenFromOwnerEnumeration(
    address from,
    uint256 tokenId
)
    private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`from`|`address`|address representing the previous owner of the given token ID|
|`tokenId`|`uint256`|uint256 ID of the token to be removed from the tokens list of the given address|


### _removeTokenFromAllTokensEnumeration

*Private function to remove a token from this extension's token
tracking data structures.
This has O(1) time complexity, but alters the order of the _allTokens
array.*


```solidity
function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenId`|`uint256`|uint256 ID of the token to be removed from the tokens list|


