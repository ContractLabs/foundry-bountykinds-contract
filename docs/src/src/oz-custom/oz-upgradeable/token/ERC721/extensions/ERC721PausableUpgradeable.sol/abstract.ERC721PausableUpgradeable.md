# ERC721PausableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721PausableUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [PausableUpgradeable](/src/oz-custom/oz-upgradeable/security/PausableUpgradeable.sol/abstract.PausableUpgradeable.md)

*ERC721 token with pausable token transfers, minting and burning.
Useful for scenarios such as preventing trades until the end of an evaluation
period, or having an emergency switch for freezing all token transfers in the
event of a large bug.*


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
### __ERC721Pausable_init


```solidity
function __ERC721Pausable_init() internal onlyInitializing;
```

### _beforeTokenTransfer

*See {ERC721-_beforeTokenTransfer}.
Requirements:
- the contract must not be paused.*


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 firstTokenId,
    uint256 batchSize
)
    internal
    virtual
    override
    whenNotPaused;
```

