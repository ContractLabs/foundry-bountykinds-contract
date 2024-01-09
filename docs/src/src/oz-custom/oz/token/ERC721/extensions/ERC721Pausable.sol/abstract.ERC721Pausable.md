# ERC721Pausable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721Pausable.sol)

**Inherits:**
[ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md), [Pausable](/src/oz-custom/oz/security/Pausable.sol/abstract.Pausable.md)

*ERC721 token with pausable token transfers, minting and burning.
Useful for scenarios such as preventing trades until the end of an evaluation
period, or having an emergency switch for freezing all token transfers in the
event of a large bug.*


## Functions
### _beforeTokenTransfer

*See {ERC721-_beforeTokenTransfer}.
Requirements:
- the contract must not be paused.*


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 tokenId,
    uint256 batchSize
)
    internal
    virtual
    override
    whenNotPaused;
```

