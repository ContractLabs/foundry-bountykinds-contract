# TreasuryUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets-upgradeable/TreasuryUpgradeable.sol)

**Inherits:**
[ITreasury](/src/oz-custom/presets/interfaces/ITreasury.sol/interface.ITreasury.md), IERC1155Receiver, [ManagerUpgradeable](/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol/abstract.ManagerUpgradeable.md), [SignableUpgradeable](/src/oz-custom/internal-upgradeable/SignableUpgradeable.sol/abstract.SignableUpgradeable.md), [WithdrawableUpgradeable](/src/oz-custom/internal-upgradeable/WithdrawableUpgradeable.sol/abstract.WithdrawableUpgradeable.md), [ERC721TokenReceiverUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721TokenReceiverUpgradeable.md)


## State Variables
### __PERMIT_TYPE_HASH
*value is equal to keccak256("Permit(address token,address to,uint256
value,uint256 amount,uint256
nonce,uint256 deadline)")*


```solidity
bytes32 private constant __PERMIT_TYPE_HASH =
    0x1d4e5c65da4048ea0e84458001171f3bf2f0666aa734d5dc971be326031829c5;
```


### safeReceivedNativeBalance

```solidity
uint256 public safeReceivedNativeBalance;
```


### erc20Balances

```solidity
mapping(address => uint256) public erc20Balances;
```


### erc721Balances

```solidity
mapping(address => mapping(uint256 => bool)) public erc721Balances;
```


### erc1155Balances

```solidity
mapping(address => mapping(uint256 => uint256)) public erc1155Balances;
```


## Functions
### __Treasury_init


```solidity
function __Treasury_init(
    IAuthority authority_,
    string calldata name_
)
    internal
    onlyInitializing;
```

### __Treasury_init_unchained


```solidity
function __Treasury_init_unchained() internal onlyInitializing;
```

### receive


```solidity
receive() external payable virtual override onlyRole(Roles.PROXY_ROLE);
```

### fallback


```solidity
fallback() external payable virtual override;
```

### onERC1155Received


```solidity
function onERC1155Received(
    address operator_,
    address,
    uint256 id_,
    uint256 value_,
    bytes calldata data_
)
    external
    returns (bytes4);
```

### onERC1155BatchReceived


```solidity
function onERC1155BatchReceived(
    address operator_,
    address,
    uint256[] calldata ids_,
    uint256[] calldata values_,
    bytes calldata data_
)
    external
    returns (bytes4);
```

### onERC721Received


```solidity
function onERC721Received(
    address operator_,
    address,
    uint256 tokenId_,
    bytes calldata data_
)
    external
    override
    returns (bytes4);
```

### notifyERC20Transfer


```solidity
function notifyERC20Transfer(
    address token_,
    uint256 value_,
    bytes calldata data_
)
    external
    virtual
    override
    onlyRole(Roles.PROXY_ROLE)
    returns (bytes4);
```

### withdraw


```solidity
function withdraw(
    address token_,
    address to_,
    uint256 value_,
    uint256 amount_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    onlyEOA
    whenNotPaused;
```

### withdraw


```solidity
function withdraw(
    address token_,
    address to_,
    uint256 value_,
    bytes calldata data_
)
    external
    virtual
    override
    onlyRole(Roles.TREASURER_ROLE);
```

### nonces


```solidity
function nonces(address account_) external view returns (uint256);
```

### safeRecoverHeader


```solidity
function safeRecoverHeader() public pure returns (bytes32);
```

### safeTransferHeader

*value is equal keccak256("SAFE_RECOVER_HEADER")*


```solidity
function safeTransferHeader() public pure returns (bytes32);
```

### supportsInterface

*value is equal keccak256("SAFE_TRANSFER")*


```solidity
function supportsInterface(bytes4 interfaceId)
    external
    pure
    virtual
    override
    returns (bool);
```

### _beforeWithdraw


```solidity
function _beforeWithdraw(
    address token,
    address to,
    uint256 value,
    uint256 amount
)
    internal
    virtual;
```

### _isRecoverHeader


```solidity
function _isRecoverHeader(bytes memory data_)
    internal
    pure
    virtual
    returns (bool);
```

### __checkInterface


```solidity
function __checkInterface(address token_, bytes4 interfaceId_) private view;
```

