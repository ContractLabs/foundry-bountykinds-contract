# ICommandGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/ICommandGate.sol)

*Interface for the command gate, managing commands and interacting with
the treasury.*


## Functions
### updateTreasury

*Updates the treasury contract.*


```solidity
function updateTreasury(ITreasury treasury_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`treasury_`|`ITreasury`|The new treasury contract address.|


### whitelistAddress

*Whitelists a given address.*


```solidity
function whitelistAddress(address addr_) external;
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
    payable;
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
    external;
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

*Deposits ERC-20 tokens with permit function and a specified command.*


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
    bytes calldata data_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`IERC20Permit`|The ERC-20 token with permit.|
|`value_`|`uint256`|The amount of tokens to deposit.|
|`deadline_`|`uint256`|The permit deadline.|
|`v`|`uint8`|The recovery id.|
|`r`|`bytes32`|The R value of the signature.|
|`s`|`bytes32`|The S value of the signature.|
|`fnSig_`|`bytes4`|The function signature.|
|`vault_`|`address`|The vault address.|
|`contract_`|`address`|The contract address.|
|`data_`|`bytes`|Additional data for the command.|


### depositERC721MultiWithCommand

*Deposits multiple ERC-721 tokens with a specified command.*


```solidity
function depositERC721MultiWithCommand(
    uint256[] calldata tokenIds_,
    IERC721[] calldata contracts_,
    bytes[] calldata data_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`tokenIds_`|`uint256[]`|Array of ERC-721 token IDs.|
|`contracts_`|`IERC721[]`|Array of ERC-721 token contracts.|
|`data_`|`bytes[]`|Array of additional data for the commands.|


### isVaultWhitelisted

*Checks if a vault address is whitelisted.*


```solidity
function isVaultWhitelisted(address addr_) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`addr_`|`address`|The vault address to check.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|A boolean indicating whether the vault is whitelisted.|


### isTargetWhitelisted

*Checks if a target address is whitelisted.*


```solidity
function isTargetWhitelisted(address addr_) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`addr_`|`address`|The target address to check.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|A boolean indicating whether the target is whitelisted.|


## Events
### Whitelisted

```solidity
event Whitelisted(address indexed addr);
```

### VaultsWhitelisted

```solidity
event VaultsWhitelisted(address[] vaults);
```

### Commanded

```solidity
event Commanded(
    address indexed to,
    bytes4 indexed functionSelector,
    bytes params,
    address indexed vault,
    address from,
    address token,
    uint256 value
);
```

## Errors
### CommandGate__ExecutionFailed

```solidity
error CommandGate__ExecutionFailed();
```

### CommandGate__InvalidArgument

```solidity
error CommandGate__InvalidArgument();
```

### CommandGate__UnknownAddress

```solidity
error CommandGate__UnknownAddress(address);
```

