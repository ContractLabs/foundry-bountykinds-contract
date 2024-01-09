# ERC721Burnable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721Burnable.sol)

**Inherits:**
[ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md), [IERC712Burnable](/src/oz-custom/oz/token/ERC721/extensions/ERC721Burnable.sol/interface.IERC712Burnable.md)

*ERC721 Token that can be burned (destroyed).*


## Functions
### burn

*Burns `tokenId`. See {ERC721-_burn}.
Requirements:
- The caller must own `tokenId` or be an approved operator.*


```solidity
function burn(uint256 tokenId) public virtual;
```

