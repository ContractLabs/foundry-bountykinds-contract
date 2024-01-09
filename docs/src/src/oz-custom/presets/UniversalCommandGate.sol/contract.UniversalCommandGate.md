# UniversalCommandGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/UniversalCommandGate.sol)

**Inherits:**
[Manager](/src/oz-custom/presets/base/Manager.sol/abstract.Manager.md), [CommandGate](/src/oz-custom/internal/CommandGate.sol/abstract.CommandGate.md), [ReentrancyGuard](/src/oz-custom/oz/security/ReentrancyGuard.sol/abstract.ReentrancyGuard.md), IERC1155Receiver, [ERC721TokenReceiver](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721TokenReceiver.md), [IUniversalCommandGate](/src/oz-custom/presets/interfaces/IUniversalCommandGate.sol/interface.IUniversalCommandGate.md)


## Functions
### constructor


```solidity
constructor(
    IAuthority authority_,
    address[] memory vaults_
)
    payable
    ReentrancyGuard
    Manager(authority_, 0)
    CommandGate(vaults_);
```

### changeVault


```solidity
function changeVault(address vault_) external onlyRole(Roles.TREASURER_ROLE);
```

### whitelistVaults


```solidity
function whitelistVaults(address[] calldata vaults_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### whitelistTarget


```solidity
function whitelistTarget(address target_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### _handleDeposit


```solidity
function _handleDeposit(
    address operator_,
    address mainVault_,
    Asset calldata asset_,
    Command calldata command_
)
    internal
    override;
```

### onERC721Received


```solidity
function onERC721Received(
    address operator_,
    address from_,
    uint256 tokenId_,
    bytes calldata data_
)
    external
    override
    whenNotPaused
    returns (bytes4);
```

### onERC1155Received


```solidity
function onERC1155Received(
    address operator_,
    address from_,
    uint256 id_,
    uint256 value_,
    bytes calldata data_
)
    external
    override
    returns (bytes4);
```

### onERC1155BatchReceived


```solidity
function onERC1155BatchReceived(
    address operator_,
    address from_,
    uint256[] calldata ids_,
    uint256[] calldata values_,
    bytes calldata data_
)
    external
    override
    returns (bytes4);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    external
    pure
    override
    returns (bool);
```

### safeRecoverHeader


```solidity
function safeRecoverHeader() public pure override returns (bytes memory);
```

### safeTransferHeader

*value is equal keccak256("SAFE_RECOVER_HEADER")*


```solidity
function safeTransferHeader() public pure override returns (bytes memory);
```

### _handleERC20Deposit

*value is equal keccak256("SAFE_TRANSFER")*


```solidity
function _handleERC20Deposit(
    address vault_,
    address mainVault_,
    Asset calldata asset_
)
    internal
    virtual;
```

### _handleERC721Deposit


```solidity
function _handleERC721Deposit(
    address vault_,
    Asset memory asset_
)
    internal
    virtual;
```

### _handleERC1155Deposit


```solidity
function _handleERC1155Deposit(
    uint256 amount_,
    address vault_,
    Asset memory asset_
)
    internal
    virtual;
```

### _handleERC1155BatchDeposit


```solidity
function _handleERC1155BatchDeposit(
    address vault_,
    Asset memory asset_,
    uint256[] memory ids_,
    uint256[] memory amounts_
)
    internal
    virtual;
```

### _handleNativeDeposit


```solidity
function _handleNativeDeposit(
    address vault_,
    address operator_,
    Asset calldata asset_
)
    internal
    virtual;
```

### _checkSender


```solidity
function _checkSender(
    bool eoaCheck_,
    address account_,
    Asset memory asset_,
    bytes memory
)
    internal
    view
    virtual
    override;
```

### _beforeRecover


```solidity
function _beforeRecover(bytes memory)
    internal
    view
    override
    whenPaused
    onlyRole(Roles.OPERATOR_ROLE);
```

### _afterRecover


```solidity
function _afterRecover(
    address,
    address,
    uint256,
    bytes memory
)
    internal
    override;
```

