# IERC1155
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC1155/IERC1155.sol)

**Inherits:**
[IERC165](/src/oz-custom/oz/utils/introspection/IERC165.sol/interface.IERC165.md)


## Functions
### uri


```solidity
function uri(uint256 id) external view returns (string memory);
```

### balanceOf

*Returns the amount of tokens of token type `id` owned by `account`.
Requirements:
- `account` cannot be the zero address.*


```solidity
function balanceOf(
    address account,
    uint256 id
)
    external
    view
    returns (uint256);
```

### balanceOfBatch

*xref:ROOT:erc1155.adoc#batch-operations[Batched] version of
{balanceOf}.
Requirements:
- `accounts` and `ids` must have the same length.*


```solidity
function balanceOfBatch(
    address[] calldata accounts,
    uint256[] calldata ids
)
    external
    view
    returns (uint256[] memory);
```

### setApprovalForAll

*Grants or revokes permission to `operator` to transfer the caller's
tokens, according to `approved`,
Emits an {ApprovalForAll} event.
Requirements:
- `operator` cannot be the caller.*


```solidity
function setApprovalForAll(address operator, bool approved) external;
```

### isApprovedForAll

*Returns true if `operator` is approved to transfer ``account``'s
tokens.
See {setApprovalForAll}.*


```solidity
function isApprovedForAll(
    address account,
    address operator
)
    external
    view
    returns (bool);
```

### safeTransferFrom

*Transfers `amount` tokens of token type `id` from `from` to `to`.
Emits a {TransferSingle} event.
Requirements:
- `to` cannot be the zero address.
- If the caller is not `from`, it must have been approved to spend
``from``'s tokens via {setApprovalForAll}.
- `from` must have a balance of tokens of type `id` of at least `amount`.
- If `to` refers to a smart contract, it must implement
{IERC1155Receiver-onERC1155Received} and return the
acceptance magic value.*


```solidity
function safeTransferFrom(
    address from,
    address to,
    uint256 id,
    uint256 amount,
    bytes calldata data
)
    external;
```

### safeBatchTransferFrom

*xref:ROOT:erc1155.adoc#batch-operations[Batched] version of
{safeTransferFrom}.
Emits a {TransferBatch} event.
Requirements:
- `ids` and `amounts` must have the same length.
- If `to` refers to a smart contract, it must implement
{IERC1155Receiver-onERC1155BatchReceived} and return the
acceptance magic value.*


```solidity
function safeBatchTransferFrom(
    address from,
    address to,
    uint256[] calldata ids,
    uint256[] calldata amounts,
    bytes calldata data
)
    external;
```

## Events
### TransferSingle
*Emitted when `value` tokens of token type `id` are transferred from
`from` to `to` by `operator`.*


```solidity
event TransferSingle(
    address indexed operator,
    address indexed from,
    address indexed to,
    uint256 id,
    uint256 amount
);
```

### TransferBatch
*Equivalent to multiple {TransferSingle} events, where `operator`,
`from` and `to` are the same for all
transfers.*


```solidity
event TransferBatch(
    address indexed operator,
    address indexed from,
    address indexed to,
    uint256[] ids,
    uint256[] amounts
);
```

### ApprovalForAll
*Emitted when `account` grants or revokes permission to `operator` to
transfer their tokens, according to
`approved`.*


```solidity
event ApprovalForAll(
    address indexed owner, address indexed operator, bool approved
);
```

### URI
*Emitted when the URI for token type `id` changes to `value`, if it
is a non-programmatic URI.
If an {URI} event was emitted for `id`, the standard
https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[guarantees]
that `value` will equal the value
returned by {IERC1155MetadataURI-uri}.*


```solidity
event URI(string value, uint256 indexed id);
```

## Errors
### ERC1155__Unauthorized

```solidity
error ERC1155__Unauthorized();
```

### ERC1155__LengthMismatch

```solidity
error ERC1155__LengthMismatch();
```

### ERC1155__UnsafeRecipient

```solidity
error ERC1155__UnsafeRecipient();
```

