# ERC721BurnableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [IERC721BurnableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol/interface.IERC721BurnableUpgradeable.md)

*ERC721 Token that can be burned (destroyed).*


## State Variables
### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[50] private __gap;
```


## Functions
### burn

*Burns `tokenId`. See {ERC721-_burn}.
Requirements:
- The caller must own `tokenId` or be an approved operator.*


```solidity
function burn(uint256 tokenId) public virtual;
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    virtual
    override(ERC721Upgradeable, IERC165Upgradeable)
    returns (bool);
```

