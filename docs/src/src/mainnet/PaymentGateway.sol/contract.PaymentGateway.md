# PaymentGateway
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/PaymentGateway.sol)

**Inherits:**
[Manager](/src/oz-custom/presets/base/Manager.sol/abstract.Manager.md), [ICommandGate](/src/oz-custom/internal/interfaces/ICommandGate.sol/interface.ICommandGate.md), [FundForwarder](/src/oz-custom/internal/FundForwarder.sol/abstract.FundForwarder.md), [ERC721TokenReceiver](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721TokenReceiver.md)


## State Variables
### __isWhitelisted

```solidity
BitMaps.BitMap private __isWhitelisted;
```


### __whitelistedVaults

```solidity
BitMaps.BitMap private __whitelistedVaults;
```


## Functions
### constructor


```solidity
constructor(
    IAuthority authority_,
    address[] memory vaults_
)
    payable
    Manager(authority_, 0);
```

### changeVault

*Allows only the treasurer to change the vault address.*


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|The new vault address.|


### whitelistVaults


```solidity
function whitelistVaults(address[] calldata vaults_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### updateTreasury

*Updates the treasury contract.*


```solidity
function updateTreasury(ITreasury treasury_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`treasury_`|`ITreasury`|The new treasury contract address.|


### whitelistAddress

*Whitelists a given address.*


```solidity
function whitelistAddress(address addr_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`addr_`|`address`|The address to be whitelisted.|


### depositNativeTokenWithCommand

*Deposits native tokens with a specified command.*


```solidity
function depositNativeTokenWithCommand(
    address contract_,
    address vault_,
    bytes4 fnSig_,
    bytes calldata params_
)
    external
    payable
    whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`contract_`|`address`|The contract address.|
|`vault_`|`address`|The vault address.|
|`fnSig_`|`bytes4`|The function signature.|
|`params_`|`bytes`|The parameters for the command.|


### depositERC20WithCommand

*Deposits ERC-20 tokens with a specified command.*


```solidity
function depositERC20WithCommand(
    IERC20 token_,
    uint256 value_,
    bytes4 fnSig_,
    address vault_,
    address contract_,
    bytes memory data_
)
    external
    whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`IERC20`|The ERC-20 token address.|
|`value_`|`uint256`|The amount of tokens to deposit.|
|`fnSig_`|`bytes4`|The function signature.|
|`vault_`|`address`|The vault address.|
|`contract_`|`address`|The contract address.|
|`data_`|`bytes`|Additional data for the command.|


### depositERC20PermitWithCommand


```solidity
function depositERC20PermitWithCommand(
    IERC20Permit token_,
    uint256 value_,
    uint256 deadline_,
    uint8 v,
    bytes32 r,
    bytes32 s,
    bytes4 fnSig_,
    address vault_,
    address contract_,
    bytes memory data_
)
    external
    whenNotPaused;
```

### onERC721Received


```solidity
function onERC721Received(
    address,
    address from_,
    uint256 tokenId_,
    bytes calldata data_
)
    external
    override
    whenNotPaused
    returns (bytes4);
```

### depositERC721MultiWithCommand

*Deposits multiple ERC-721 tokens with a specified command.*


```solidity
function depositERC721MultiWithCommand(
    uint256[] calldata tokenIds_,
    IERC721[] calldata contracts_,
    bytes[] calldata data_
)
    external
    whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenIds_`|`uint256[]`|Array of ERC-721 token IDs.|
|`contracts_`|`IERC721[]`|Array of ERC-721 token contracts.|
|`data_`|`bytes[]`|Array of additional data for the commands.|


### isVaultWhitelisted


```solidity
function isVaultWhitelisted(address addr_) external view returns (bool);
```

### isTargetWhitelisted


```solidity
function isTargetWhitelisted(address addr_) external view returns (bool);
```

### __whitelistVaults


```solidity
function __whitelistVaults(address[] memory vaults_) private;
```

### __executeTx


```solidity
function __executeTx(
    address target_,
    bytes4 fnSignature_,
    bytes memory params_
)
    private;
```

### __checkUser


```solidity
function __checkUser(address user_) private view;
```

### __concatDepositData


```solidity
function __concatDepositData(
    address account_,
    address token_,
    uint256 value_,
    bytes memory data_
)
    private
    pure
    returns (bytes memory);
```

### _beforeRecover


```solidity
function _beforeRecover(bytes memory)
    internal
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

### safeRecoverHeader


```solidity
function safeRecoverHeader() public pure override returns (bytes memory);
```

### safeTransferHeader

*value is equal keccak256("SAFE_RECOVER_HEADER")*


```solidity
function safeTransferHeader() public pure override returns (bytes memory);
```

