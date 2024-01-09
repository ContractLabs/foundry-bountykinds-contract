# ERC721URIStorageUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md)

*ERC721 token with storage based token URI management.*


## State Variables
### _baseTokenURIPtr

```solidity
bytes32 internal _baseTokenURIPtr;
```


### __tokenURIs

```solidity
mapping(uint256 => bytes32) private __tokenURIs;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[48] private __gap;
```


## Functions
### __ERC721URIStorage_init


```solidity
function __ERC721URIStorage_init(string calldata baseURI_)
    internal
    onlyInitializing;
```

### __ERC721URIStorage_init_unchained


```solidity
function __ERC721URIStorage_init_unchained(string calldata baseURI_)
    internal
    onlyInitializing;
```

### _baseURI


```solidity
function _baseURI() internal view virtual override returns (string memory);
```

### tokenURI

*See {IERC721Metadata-tokenURI}.*


```solidity
function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory);
```

### _setTokenURI

*Sets `_tokenURI` as the tokenURI of `tokenId`.
Requirements:
- `tokenId` must exist.*


```solidity
function _setTokenURI(
    uint256 tokenId,
    string calldata _tokenURI
)
    internal
    virtual;
```

### _burn

*See {ERC721-_burn}. This override additionally checks to see if a
token-specific URI was set for the token, and if so, it deletes the token
URI from
the storage mapping.*


```solidity
function _burn(uint256 tokenId) internal virtual override;
```

