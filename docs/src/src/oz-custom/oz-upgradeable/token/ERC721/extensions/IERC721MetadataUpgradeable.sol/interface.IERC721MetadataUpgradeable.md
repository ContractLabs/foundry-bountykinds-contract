# IERC721MetadataUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721MetadataUpgradeable.sol)

**Inherits:**
[IERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/IERC721Upgradeable.sol/interface.IERC721Upgradeable.md)

*See https://eips.ethereum.org/EIPS/eip-721*


## Functions
### name

*Returns the token collection name.*


```solidity
function name() external view returns (string memory);
```

### symbol

*Returns the token collection symbol.*


```solidity
function symbol() external view returns (string memory);
```

### tokenURI

*Returns the Uniform Resource Identifier (URI) for `tokenId` token.*


```solidity
function tokenURI(uint256 tokenId) external view returns (string memory);
```

