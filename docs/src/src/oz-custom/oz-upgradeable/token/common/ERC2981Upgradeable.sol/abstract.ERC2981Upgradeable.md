# ERC2981Upgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/common/ERC2981Upgradeable.sol)

**Inherits:**
[IERC2981Upgradeable](/src/oz-custom/oz-upgradeable/interfaces/IERC2981Upgradeable.sol/interface.IERC2981Upgradeable.md), [ERC165Upgradeable](/src/oz-custom/oz-upgradeable/utils/introspection/ERC165Upgradeable.sol/abstract.ERC165Upgradeable.md)

*Implementation of the NFT Royalty Standard, a standardized way to
retrieve royalty payment information.
Royalty information can be specified globally for all token ids via
{_setDefaultRoyalty}, and/or individually for
specific token ids via {_setTokenRoyalty}. The latter takes precedence over
the first.
Royalty is specified as a fraction of sale price. {_feeDenominator} is
overridable but defaults to 10000, meaning the
fee is specified in basis points by default.
IMPORTANT: ERC-2981 only specifies a way to signal royalty information and
does not enforce its payment. See
https://eips.ethereum.org/EIPS/eip-2981#optional-royalty-payments[Rationale]
in the EIP. Marketplaces are expected to
voluntarily pay royalties together with sales, but note that this standard is
not yet widely supported.
_Available since v4.5._*


## State Variables
### _defaultRoyaltyInfo

```solidity
RoyaltyInfo internal _defaultRoyaltyInfo;
```


### _tokenRoyaltyInfo

```solidity
mapping(uint256 => RoyaltyInfo) internal _tokenRoyaltyInfo;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[48] private __gap;
```


## Functions
### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(IERC165Upgradeable, ERC165Upgradeable)
    returns (bool);
```

### royaltyInfo

*Returns how much royalty is owed and to whom, based on a sale price
that may be denominated in any unit of
exchange. The royalty amount is denominated and should be paid in that
same unit of exchange.*


```solidity
function royaltyInfo(
    uint256 _tokenId,
    uint256 _salePrice
)
    public
    view
    virtual
    override
    returns (address, uint256);
```

### _feeDenominator

*The denominator with which to interpret the fee set in
{_setTokenRoyalty} and {_setDefaultRoyalty} as a
fraction of the sale price. Defaults to 10000 so fees are expressed in
basis points, but may be customized by an
override.*


```solidity
function _feeDenominator() internal pure virtual returns (uint96);
```

### _setDefaultRoyalty

*Sets the royalty information that all ids in this contract will
default to.
Requirements:
- `receiver` cannot be the zero address.
- `feeNumerator` cannot be greater than the fee denominator.*


```solidity
function _setDefaultRoyalty(
    address receiver,
    uint96 feeNumerator
)
    internal
    virtual;
```

### _deleteDefaultRoyalty

*Removes default royalty information.*


```solidity
function _deleteDefaultRoyalty() internal virtual;
```

### _setTokenRoyalty

*Sets the royalty information for a specific token id, overriding the
global default.
Requirements:
- `receiver` cannot be the zero address.
- `feeNumerator` cannot be greater than the fee denominator.*


```solidity
function _setTokenRoyalty(
    uint256 tokenId,
    address receiver,
    uint96 feeNumerator
)
    internal
    virtual;
```

### _resetTokenRoyalty

*Resets royalty information for the token id back to the global
default.*


```solidity
function _resetTokenRoyalty(uint256 tokenId) internal virtual;
```

### __nonZeroAdress


```solidity
function __nonZeroAdress(address addr_) private pure;
```

