# ERC721RentableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721RentableUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [IERC721RentableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721RentableUpgradeable.sol/interface.IERC721RentableUpgradeable.md)


## State Variables
### _users

```solidity
mapping(uint256 => UserInfo) internal _users;
```


### __gap
*value is equal to
keccak256("UpdateUser(uint256,address,uint64)")*


```solidity
uint256[49] private __gap;
```


## Functions
### setUser


```solidity
function setUser(
    uint256 tokenId,
    address user,
    uint64 expires
)
    public
    virtual;
```

### userOf

*value is equal to
keccak256("UpdateUser(uint256,address,uint64)")*


```solidity
function userOf(uint256 tokenId)
    public
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
    override(IERC165Upgradeable, ERC721Upgradeable)
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

