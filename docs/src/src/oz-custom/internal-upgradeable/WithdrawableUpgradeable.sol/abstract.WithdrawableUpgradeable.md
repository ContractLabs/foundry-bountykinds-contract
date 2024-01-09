# WithdrawableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/WithdrawableUpgradeable.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [TransferableUpgradeable](/src/oz-custom/internal-upgradeable/TransferableUpgradeable.sol/abstract.TransferableUpgradeable.md), [IWithdrawableUpgradeable](/src/oz-custom/internal-upgradeable/interfaces/IWithdrawableUpgradeable.sol/interface.IWithdrawableUpgradeable.md)

*Allows tokens and Ether to be withdrawn from the contract*


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


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
|`value_`|`uint256`|Amount of tokens or Ether to withdraw|
|`data_`|`bytes`||


