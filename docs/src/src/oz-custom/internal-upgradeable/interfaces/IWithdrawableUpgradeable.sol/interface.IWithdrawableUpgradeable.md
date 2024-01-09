# IWithdrawableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/interfaces/IWithdrawableUpgradeable.sol)


## Functions
### notifyERC20Transfer


```solidity
function notifyERC20Transfer(
    address token_,
    uint256 value_,
    bytes calldata data_
)
    external
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
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|Address of the token contract to withdraw. If zero address, withdraw Ether.|
|`to_`|`address`|Address to send the tokens or Ether to|
|`value_`|`uint256`|Amount of tokens or Ether to withdraw|
|`data_`|`bytes`||


## Events
### Withdrawn

```solidity
event Withdrawn(
    address indexed token, address indexed to, uint256 indexed value
);
```

### Received
*Event emitted when funds are received by the contract*


```solidity
event Received(
    address indexed sender, address indexed token, bytes value, bytes data
);
```

