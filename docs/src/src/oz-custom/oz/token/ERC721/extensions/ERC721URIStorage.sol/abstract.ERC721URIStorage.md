# ERC721URIStorage
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721URIStorage.sol)

**Inherits:**
[ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md)

*ERC721 token with storage based token URI management.*


## State Variables
### _baseTokenURI

```solidity
string internal _baseTokenURI;
```


### __tokenURIs

```solidity
mapping(uint256 => string) private __tokenURIs;
```


## Functions
### constructor


```solidity
constructor(string memory baseURI_) payable;
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

