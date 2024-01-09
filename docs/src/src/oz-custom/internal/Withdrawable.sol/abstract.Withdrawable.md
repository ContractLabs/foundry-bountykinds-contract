# Withdrawable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/Withdrawable.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [Transferable](/src/oz-custom/internal/Transferable.sol/abstract.Transferable.md), [IWithdrawable](/src/oz-custom/internal/interfaces/IWithdrawable.sol/interface.IWithdrawable.md)

*Allows tokens and Ether to be withdrawn from the contract*


## Functions
### receive

*Fallback function to receive funds when msg.data is empty and emit
the Received event*


```solidity
receive() external payable virtual;
```

### fallback

*Fallback function to receive funds when msg.data is not empty and
emit the Received event*


```solidity
fallback() external payable virtual;
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
    returns (bytes4);
```

### withdraw

*Withdraws the given amount of tokens or Ether from the contract*


```solidity
function withdraw(
    address token_,
    address to_,
    uint256 value_,
    bytes calldata data_
)
    external
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|Address of the token contract to withdraw. If zero address, withdraw Ether.|
|`to_`|`address`|Address to send the tokens or Ether to|
|`value_`|`uint256`||
|`data_`|`bytes`||


