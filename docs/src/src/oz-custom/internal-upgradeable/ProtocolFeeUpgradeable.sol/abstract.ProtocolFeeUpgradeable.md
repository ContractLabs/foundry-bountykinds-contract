# ProtocolFeeUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/ProtocolFeeUpgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [IProtocolFeeUpgradeable](/src/oz-custom/internal-upgradeable/interfaces/IProtocolFeeUpgradeable.sol/interface.IProtocolFeeUpgradeable.md)

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


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### __ProtocolFee_init


```solidity
function __ProtocolFee_init(
    address token_,
    uint96 feeAmt_
)
    internal
    virtual
    onlyInitializing;
```

### __ProtocolFee_init_unchained


```solidity
function __ProtocolFee_init_unchained(
    address token_,
    uint96 feeAmt_
)
    internal
    virtual
    onlyInitializing;
```

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


