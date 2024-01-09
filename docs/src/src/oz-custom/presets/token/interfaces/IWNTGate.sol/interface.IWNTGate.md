# IWNTGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/token/interfaces/IWNTGate.sol)


## Functions
### withdraw

*Transfer assets to a receiver.*


```solidity
function withdraw(address receiver, uint256 wad) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`receiver`|`address`|This address will receive a transfer.|
|`wad`|`uint256`|Amount in wei|


### wnt


```solidity
function wnt() external view returns (IWNT);
```

## Events
### Withdrawal

```solidity
event Withdrawal(address indexed receiver, uint256 wad);
```

### Received

```solidity
event Received(address indexed sender, uint256 indexed amount);
```

## Errors
### WNTGate__InvalidAddress

```solidity
error WNTGate__InvalidAddress();
```

