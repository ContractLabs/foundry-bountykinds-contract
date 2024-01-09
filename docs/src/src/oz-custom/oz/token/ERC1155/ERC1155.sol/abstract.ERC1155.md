# ERC1155
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC1155/ERC1155.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [IERC1155](/src/oz-custom/oz/token/ERC1155/IERC1155.sol/interface.IERC1155.md)

**Author:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC1155.sol)

Minimalist and gas efficient standard ERC1155 implementation.


## State Variables
### __uri

```solidity
string private __uri;
```


### _isApprovedForAll

```solidity
mapping(address => BitMaps.BitMap) internal _isApprovedForAll;
```


### balanceOf

```solidity
mapping(address => mapping(uint256 => uint256)) public balanceOf;
```


## Functions
### uri


```solidity
function uri(uint256) public view virtual returns (string memory);
```

### isApprovedForAll


```solidity
function isApprovedForAll(
    address owner_,
    address operator_
)
    external
    view
    returns (bool);
```

### setApprovalForAll


```solidity
function setApprovalForAll(address operator, bool approved) public virtual;
```

### safeTransferFrom


```solidity
function safeTransferFrom(
    address from,
    address to,
    uint256 id,
    uint256 amount,
    bytes calldata data
)
    public
    virtual;
```

### safeBatchTransferFrom


```solidity
function safeBatchTransferFrom(
    address from,
    address to,
    uint256[] calldata ids,
    uint256[] calldata amounts,
    bytes calldata data
)
    public
    virtual;
```

### balanceOfBatch


```solidity
function balanceOfBatch(
    address[] calldata owners,
    uint256[] calldata ids
)
    public
    view
    virtual
    returns (uint256[] memory balances);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    returns (bool);
```

### _setURI


```solidity
function _setURI(string memory newURI_) internal virtual;
```

### _mint


```solidity
function _mint(
    address to,
    uint256 id,
    uint256 amount,
    bytes memory data
)
    internal
    virtual;
```

### _batchMint


```solidity
function _batchMint(
    address to,
    uint256[] calldata ids,
    uint256[] calldata amounts,
    bytes memory data
)
    internal
    virtual;
```

### _batchBurn


```solidity
function _batchBurn(
    address from,
    uint256[] calldata ids,
    uint256[] calldata amounts
)
    internal
    virtual;
```

### _burn


```solidity
function _burn(address from, uint256 id, uint256 amount) internal virtual;
```

