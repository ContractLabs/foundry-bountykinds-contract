# ISignableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/interfaces/ISignableUpgradeable.sol)


## Functions
### DOMAIN_SEPARATOR

*Returns the domain separator for EIP712 v4*


```solidity
function DOMAIN_SEPARATOR() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|Domain separator for EIP712 v4|


## Events
### NonceIncremented

```solidity
event NonceIncremented(
    address indexed operator, bytes32 indexed id, uint256 indexed value
);
```

## Errors
### Signable__InvalidSignature

```solidity
error Signable__InvalidSignature();
```

