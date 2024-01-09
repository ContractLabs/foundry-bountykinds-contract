# IERC721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/IERC721.sol)

**Inherits:**
[IERC165](/src/oz-custom/oz/utils/introspection/IERC165.sol/interface.IERC165.md)

*Required interface of an ERC721 compliant contract.*


## Functions
### balanceOf

*Returns the number of tokens in ``owner``'s account.*


```solidity
function balanceOf(address owner) external view returns (uint256 balance);
```

### ownerOf

*Returns the owner of the `tokenId` token.
Requirements:
- `tokenId` must exist.*


```solidity
function ownerOf(uint256 tokenId) external view returns (address owner);
```

### safeTransferFrom

*Safely transfers `tokenId` token from `from` to `to`.
Requirements:
- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must exist and be owned by `from`.
- If the caller is not `from`, it must be approved to move this token by
either {approve} or {setApprovalForAll}.
- If `to` refers to a smart contract, it must implement
{IERC721Receiver-onERC721Received}, which is called upon
a safe transfer.
Emits a {Transfer} event.*


```solidity
function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes calldata data
)
    external;
```

### safeTransferFrom

*Safely transfers `tokenId` token from `from` to `to`, checking first
that contract recipients
are aware of the ERC721 protocol to prevent tokens from being forever
locked.
Requirements:
- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must exist and be owned by `from`.
- If the caller is not `from`, it must have been allowed to move this
token by either {approve} or
{setApprovalForAll}.
- If `to` refers to a smart contract, it must implement
{IERC721Receiver-onERC721Received}, which is called upon
a safe transfer.
Emits a {Transfer} event.*


```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) external;
```

### transferFrom

*Transfers `tokenId` token from `from` to `to`.
WARNING: Usage of this method is discouraged, use {safeTransferFrom}
whenever possible.
Requirements:
- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `tokenId` token must be owned by `from`.
- If the caller is not `from`, it must be approved to move this token by
either {approve} or {setApprovalForAll}.
Emits a {Transfer} event.*


```solidity
function transferFrom(address from, address to, uint256 tokenId) external;
```

### approve

*Gives permission to `to` to transfer `tokenId` token to another
account.
The approval is cleared when the token is transferred.
Only a single account can be approved at a time, so approving the zero
address clears previous approvals.
Requirements:
- The caller must own the token or be an approved operator.
- `tokenId` must exist.
Emits an {Approval} event.*


```solidity
function approve(address to, uint256 tokenId) external;
```

### setApprovalForAll

*Approve or remove `operator` as an operator for the caller.
Operators can call {transferFrom} or {safeTransferFrom} for any token
owned by the caller.
Requirements:
- The `operator` cannot be the caller.
Emits an {ApprovalForAll} event.*


```solidity
function setApprovalForAll(address operator, bool _approved) external;
```

### getApproved

*Returns the account approved for `tokenId` token.
Requirements:
- `tokenId` must exist.*


```solidity
function getApproved(uint256 tokenId)
    external
    view
    returns (address operator);
```

### isApprovedForAll

*Returns if the `operator` is allowed to manage all of the assets of
`owner`.
See {setApprovalForAll}*


```solidity
function isApprovedForAll(
    address owner,
    address operator
)
    external
    view
    returns (bool);
```

## Events
### Transfer
*Emitted when `tokenId` token is transferred from `from` to `to`.*


```solidity
event Transfer(
    address indexed from, address indexed to, uint256 indexed tokenId
);
```

### Approval
*Emitted when `owner` enables `approved` to manage the `tokenId`
token.*


```solidity
event Approval(
    address indexed owner, address indexed approved, uint256 indexed tokenId
);
```

### ApprovalForAll
*Emitted when `owner` enables or disables (`approved`) `operator` to
manage all of its assets.*


```solidity
event ApprovalForAll(
    address indexed owner, address indexed operator, bool approved
);
```

## Errors
### ERC721__NotMinted

```solidity
error ERC721__NotMinted();
```

### ERC721__WrongFrom

```solidity
error ERC721__WrongFrom();
```

### ERC721__Unauthorized

```solidity
error ERC721__Unauthorized();
```

### ERC721__StringTooLong

```solidity
error ERC721__StringTooLong();
```

### ERC721__AlreadyMinted

```solidity
error ERC721__AlreadyMinted();
```

### ERC721__NonZeroAddress

```solidity
error ERC721__NonZeroAddress();
```

### ERC721__UnsafeRecipient

```solidity
error ERC721__UnsafeRecipient();
```

### ERC721__InvalidRecipient

```solidity
error ERC721__InvalidRecipient();
```

