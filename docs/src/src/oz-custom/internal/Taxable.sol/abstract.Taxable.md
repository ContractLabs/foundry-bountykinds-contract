# Taxable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/Taxable.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [ITaxable](/src/oz-custom/internal/interfaces/ITaxable.sol/interface.ITaxable.md)


## State Variables
### taxBeneficiary

```solidity
address public taxBeneficiary;
```


### taxEnabledTimestamp

```solidity
uint256 public taxEnabledTimestamp;
```


## Functions
### whenTaxEnabled


```solidity
modifier whenTaxEnabled() virtual;
```

### constructor


```solidity
constructor(address taxBeneficiary_) payable;
```

### _setTaxBeneficiary


```solidity
function _setTaxBeneficiary(address taxBeneficiary_) internal virtual;
```

### _toggleTax


```solidity
function _toggleTax() internal virtual;
```

### tax


```solidity
function tax(
    address token_,
    uint256 amount_
)
    public
    view
    virtual
    returns (uint256);
```

### taxFraction


```solidity
function taxFraction(address token_) public pure virtual returns (uint256);
```

### percentageFraction


```solidity
function percentageFraction() public pure virtual returns (uint256);
```

### taxEnabledDuration


```solidity
function taxEnabledDuration() public pure virtual returns (uint256);
```

### _checkTaxEnabled


```solidity
function _checkTaxEnabled() internal view;
```

### isTaxEnabled


```solidity
function isTaxEnabled() public view virtual returns (bool);
```

