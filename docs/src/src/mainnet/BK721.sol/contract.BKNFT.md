# BKNFT
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BK721.sol)

**Inherits:**
[IBKNFT](/src/mainnet/BK721.sol/interface.IBKNFT.md), [BK721](/src/mainnet/BK721.sol/abstract.BK721.md), [ERC721BurnableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol/abstract.ERC721BurnableUpgradeable.md)


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    string calldata name_,
    string calldata symbol_,
    string calldata baseURI_,
    uint96 feeAmt_,
    address feeToken_,
    IAuthority authority_
)
    external
    initializer;
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    virtual
    override(BK721, ERC721BurnableUpgradeable)
    returns (bool);
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 tokenId_,
    uint256 batchSize_
)
    internal
    override(BK721, ERC721Upgradeable);
```

