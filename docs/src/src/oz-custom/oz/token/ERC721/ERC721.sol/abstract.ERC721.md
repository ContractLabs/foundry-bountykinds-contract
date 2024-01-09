# ERC721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/ERC721.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [ERC165](/src/oz-custom/oz/utils/introspection/ERC165.sol/abstract.ERC165.md), [IERC721](/src/oz-custom/oz/token/ERC721/IERC721.sol/interface.IERC721.md), [IERC721Metadata](/src/oz-custom/oz/token/ERC721/extensions/IERC721Metadata.sol/interface.IERC721Metadata.md)

**Author:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC721.sol)

Modern, minimalist, and gas efficient ERC-721 implementation.


## State Variables
### name

```solidity
string public name;
```


### symbol

```solidity
string public symbol;
```


### _ownerOf

```solidity
mapping(uint256 => bytes32) internal _ownerOf;
```


### _balanceOf

```solidity
mapping(address => uint256) internal _balanceOf;
```


### _getApproved

```solidity
mapping(uint256 => bytes32) internal _getApproved;
```


### _isApprovedForAll

```solidity
mapping(address => BitMaps.BitMap) internal _isApprovedForAll;
```


## Functions
### _baseURI


```solidity
function _baseURI() internal view virtual returns (string memory);
```

### tokenURI


```solidity
function tokenURI(uint256 id) public view virtual returns (string memory);
```

### ownerOf


```solidity
function ownerOf(uint256 id)
    public
    view
    virtual
    override
    returns (address owner);
```

### balanceOf


```solidity
function balanceOf(address owner)
    public
    view
    virtual
    override
    returns (uint256 balance_);
```

### constructor


```solidity
constructor(string memory _name, string memory _symbol) payable;
```

### approve


```solidity
function approve(address spender, uint256 id) public virtual;
```

### setApprovalForAll

*owner = _ownerOf[id]*

*if (sender != owner)*

*value is equal to
keccak256("Approval(address,address,uint256)")*


```solidity
function setApprovalForAll(address operator, bool approved) public virtual;
```

### getApproved

*value is equal to
keccak256("ApprovalForAll(address,address,bool)")*


```solidity
function getApproved(uint256 tokenId)
    external
    view
    returns (address approval);
```

### isApprovedForAll


```solidity
function isApprovedForAll(
    address owner,
    address operator
)
    external
    view
    returns (bool approved);
```

### _isApprovedOrOwner


```solidity
function _isApprovedOrOwner(
    address spender,
    uint256 tokenId
)
    internal
    view
    virtual
    returns (bool isApprovedOrOwner_);
```

### _beforeTokenTransfer

*Hook that is called before any token transfer. This includes minting
and burning. If {ERC721Consecutive} is
used, the hook may be called as part of a consecutive (batch) mint, as
indicated by `batchSize` greater than 1.
Calling conditions:
- When `from` and `to` are both non-zero, ``from``'s tokens will be
transferred to `to`.
- When `from` is zero, the tokens will be minted for `to`.
- When `to` is zero, ``from``'s tokens will be burned.
- `from` and `to` are never both zero.
- `batchSize` is non-zero.
To learn more about hooks, head to
xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].*


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256,
    uint256 batchSize
)
    internal
    virtual;
```

### _afterTokenTransfer

*Hook that is called after any token transfer. This includes minting
and burning. If {ERC721Consecutive} is
used, the hook may be called as part of a consecutive (batch) mint, as
indicated by `batchSize` greater than 1.
Calling conditions:
- When `from` and `to` are both non-zero, ``from``'s tokens were
transferred to `to`.
- When `from` is zero, the tokens were minted for `to`.
- When `to` is zero, ``from``'s tokens were burned.
- `from` and `to` are never both zero.
- `batchSize` is non-zero.
To learn more about hooks, head to
xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].*


```solidity
function _afterTokenTransfer(
    address from,
    address to,
    uint256 firstTokenId,
    uint256 batchSize
)
    internal
    virtual;
```

### transferFrom


```solidity
function transferFrom(address from, address to, uint256 id) public virtual;
```

### safeTransferFrom

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function safeTransferFrom(
    address from,
    address to,
    uint256 id
)
    public
    virtual;
```

### safeTransferFrom


```solidity
function safeTransferFrom(
    address from,
    address to,
    uint256 id,
    bytes calldata data
)
    public
    virtual;
```

### _transfer


```solidity
function _transfer(
    address from,
    address to,
    uint256 tokenId
)
    internal
    virtual;
```

### supportsInterface

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC165, IERC165)
    returns (bool);
```

### _mint


```solidity
function _mint(address to, uint256 id) internal virtual;
```

### _burn

*cachedVal = _ownerOf[id]*

*if (owner != 0) revert*

*emit Transfer(address(0), to, id)*

*value is equal to
keccak256("Transfer(address,address,uint256)")*

*_ownerOf[id] = to*

*cachedVal = _balanceOf[to] + 1*


```solidity
function _burn(uint256 id) internal virtual;
```

### _safeMint

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function _safeMint(address to, uint256 id) internal virtual;
```

### _safeMint


```solidity
function _safeMint(
    address to,
    uint256 id,
    bytes memory data
)
    internal
    virtual;
```

