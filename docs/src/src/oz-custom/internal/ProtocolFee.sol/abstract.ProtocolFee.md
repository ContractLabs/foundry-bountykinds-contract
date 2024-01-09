# ProtocolFee
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/ProtocolFee.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [IProtocolFee](/src/oz-custom/internal/interfaces/IProtocolFee.sol/interface.IProtocolFee.md)

*Abstract contract for protocol fees.*

*An implementation of this contract should define the
`_percentageFraction` function, which returns the
percentage fraction of the fee.*

*The fee amount is calculated as the product of the fee percentage and
the fee value.*


## State Variables
### feeInfo

```solidity
FeeInfo public feeInfo;
```


## Functions
### _setRoyalty

*Sets the royalty fee information*


```solidity
function _setRoyalty(address token_, uint96 amount_) internal virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|Token address of the fee|
|`amount_`|`uint96`|Fee amount|


### _percentageFraction

*value is equal to
keccak256("ProtocolFeeUpdated(address,address,uint256)")*

*Pure virtual function to return the percentage fraction of the fee*


```solidity
function _percentageFraction() internal pure virtual returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|Percentage fraction of the fee|


