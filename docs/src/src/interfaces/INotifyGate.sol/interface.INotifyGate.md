# INotifyGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/INotifyGate.sol)

*Interface for the NotifyGate contract, managing notification-related
functionalities.*


## Functions
### notifyWithNative

*Notifies the gate with a native token.*


```solidity
function notifyWithNative(bytes calldata message_) external payable;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`message_`|`bytes`|The content of the notification.|


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
    external;
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


## Events
### Notified
*Emitted when a notification is successfully executed.*


```solidity
event Notified(
    address indexed sender,
    bytes indexed message,
    address indexed token,
    uint256 value
);
```

## Errors
### NofifyGate__ExecutionFailed

```solidity
error NofifyGate__ExecutionFailed();
```

