# ERC721RoyaltyUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721RoyaltyUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [ERC2981Upgradeable](/src/oz-custom/oz-upgradeable/token/common/ERC2981Upgradeable.sol/abstract.ERC2981Upgradeable.md)

*Extension of ERC721 with the ERC2981 NFT Royalty Standard, a
standardized way to retrieve royalty payment
information.
Royalty information can be specified globally for all token ids via
{_setDefaultRoyalty}, and/or individually for
specific token ids via {_setTokenRoyalty}. The latter takes precedence over
the first.
IMPORTANT: ERC-2981 only specifies a way to signal royalty information and
does not enforce its payment. See
https://eips.ethereum.org/EIPS/eip-2981#optional-royalty-payments[Rationale]
in the EIP. Marketplaces are expected to
voluntarily pay royalties together with sales, but note that this standard is
not yet widely supported.
_Available since v4.5._*


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
### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC721Upgradeable, ERC2981Upgradeable)
    returns (bool);
```

### _burn

*See {ERC721-_burn}. This override additionally clears the royalty
information for the token.*


```solidity
function _burn(uint256 tokenId) internal virtual override;
```

