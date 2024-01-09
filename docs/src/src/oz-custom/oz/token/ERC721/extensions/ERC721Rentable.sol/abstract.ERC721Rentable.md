# ERC721Rentable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721Rentable.sol)

**Inherits:**
[IERC721Rentable](/src/oz-custom/oz/token/ERC721/extensions/IERC721Rentable.sol/interface.IERC721Rentable.md), [ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md)


## State Variables
### _users

```solidity
mapping(uint256 => UserInfo) internal _users;
```


## Functions
### setUser


```solidity
function setUser(
    uint256 tokenId,
    address user,
    uint64 expires
)
    external
    virtual;
```

### userOf

*value is equal to
keccak256("UpdateUser(uint256,address,uint64)")*


```solidity
function userOf(uint256 tokenId)
    external
    view
    virtual
    override
    returns (address user);
```

### userExpires


```solidity
function userExpires(uint256 tokenId)
    public
    view
    virtual
    override
    returns (uint256 expires);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(IERC165, ERC721)
    returns (bool);
```

### _beforeTokenTransfer


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

