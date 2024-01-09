# IProtocolFee
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/IProtocolFee.sol)


## Functions
### setRoyalty


```solidity
function setRoyalty(address token_, uint96 feeAmt_) external;
```

## Events
### ProtocolFeeUpdated

```solidity
event ProtocolFeeUpdated(
    address indexed operator, address indexed payment, uint256 indexed royalty
);
```

## Structs
### FeeInfo
*Fee information structure*


```solidity
struct FeeInfo {
    address token;
    uint96 royalty;
}
```

