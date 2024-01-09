# ERC721Royalty
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721Royalty.sol)

**Inherits:**
[ERC2981](/src/oz-custom/oz/token/common/ERC2981.sol/abstract.ERC2981.md), [ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md)

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


## Functions
### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC721, ERC2981)
    returns (bool);
```

### _burn

*See {ERC721-_burn}. This override additionally clears the royalty
information for the token.*


```solidity
function _burn(uint256 tokenId) internal virtual override;
```

