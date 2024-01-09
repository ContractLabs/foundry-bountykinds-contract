# NotifyGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/NotifyGate.sol)

**Inherits:**
[Manager](/src/oz-custom/presets/base/Manager.sol/abstract.Manager.md), [INotifyGate](/src/interfaces/INotifyGate.sol/interface.INotifyGate.md), [ReentrancyGuard](/src/oz-custom/oz/security/ReentrancyGuard.sol/abstract.ReentrancyGuard.md), [BKFundForwarder](/src/internal/BKFundForwarder.sol/abstract.BKFundForwarder.md), [ERC721TokenReceiver](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721TokenReceiver.md)


## Functions
### constructor


```solidity
constructor(IAuthority authority_)
    payable
    ReentrancyGuard
    Manager(authority_, 0);
```

### changeVault

*Allows only the treasurer to change the vault address.*


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.TREASURER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|The new vault address.|


### notifyWithNative

*Notifies the gate with a native token.*


```solidity
function notifyWithNative(bytes calldata message_) external payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`message_`|`bytes`|The content of the notification.|


### onERC721Received


```solidity
function onERC721Received(
    address from_,
    address,
    uint256 tokenId_,
    bytes calldata message_
)
    external
    override
    returns (bytes4);
```

### notifyWithERC20

*Notifies the gate with an ERC20 token.*


```solidity
function notifyWithERC20(
    IERC20 token_,
    uint256 value_,
    uint256 deadline_,
    uint8 v,
    bytes32 r,
    bytes32 s,
    bytes calldata message_
)
    external
    nonReentrant;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`IERC20`|The ERC20 token used for the notification.|
|`value_`|`uint256`|The value associated with the notification.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`v`|`uint8`|The recovery id.|
|`r`|`bytes32`|The R value of the signature.|
|`s`|`bytes32`|The S value of the signature.|
|`message_`|`bytes`|The content of the notification.|


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

