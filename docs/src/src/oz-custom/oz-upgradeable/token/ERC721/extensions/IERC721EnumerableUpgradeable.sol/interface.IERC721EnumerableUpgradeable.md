# IERC721EnumerableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721EnumerableUpgradeable.sol)

**Inherits:**
[IERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/IERC721Upgradeable.sol/interface.IERC721Upgradeable.md)

*See https://eips.ethereum.org/EIPS/eip-721*


## Functions
### totalSupply

*Returns the total amount of tokens stored by the contract.*


```solidity
function totalSupply() external view returns (uint256);
```

### tokenOfOwnerByIndex

*Returns a token ID owned by `owner` at a given `index` of its token
list.
Use along with {balanceOf} to enumerate all of ``owner``'s tokens.*


```solidity
function tokenOfOwnerByIndex(
    address owner,
    uint256 index
)
    external
    view
    returns (uint256);
```

### tokenByIndex

*Returns a token ID at a given `index` of all the tokens stored by
the contract.
Use along with {totalSupply} to enumerate all tokens.*


```solidity
function tokenByIndex(uint256 index) external view returns (uint256);
```

## Errors
### ERC721Enumerable__OutOfBounds

```solidity
error ERC721Enumerable__OutOfBounds();
```

### ERC721Enumerable__GlobalIndexOutOfBounds

```solidity
error ERC721Enumerable__GlobalIndexOutOfBounds();
```

### ERC721Enumerable__ConsecutiveTransferNotSupported

```solidity
error ERC721Enumerable__ConsecutiveTransferNotSupported();
```

