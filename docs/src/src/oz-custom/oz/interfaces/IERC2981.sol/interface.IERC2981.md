# IERC2981
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/interfaces/IERC2981.sol)

**Inherits:**
[IERC165](/src/oz-custom/oz/utils/introspection/IERC165.sol/interface.IERC165.md)

*Interface for the NFT Royalty Standard.
A standardized way to retrieve royalty payment information for non-fungible
tokens (NFTs) to enable universal
support for royalty payments across all NFT marketplaces and ecosystem
participants.
_Available since v4.5._*


## Functions
### royaltyInfo

*Returns how much royalty is owed and to whom, based on a sale price
that may be denominated in any unit of
exchange. The royalty amount is denominated and should be paid in that
same unit of exchange.*


```solidity
function royaltyInfo(
    uint256 tokenId,
    uint256 salePrice
)
    external
    view
    returns (address receiver, uint256 royaltyAmount);
```

## Errors
### ERC2981__InvalidArguments

```solidity
error ERC2981__InvalidArguments();
```

### ERC2981__SalePriceExceeded

```solidity
error ERC2981__SalePriceExceeded();
```

## Structs
### RoyaltyInfo

```solidity
struct RoyaltyInfo {
    address receiver;
    uint96 royaltyFraction;
}
```

