# ITaxable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/ITaxable.sol)


## Functions
### toggleTax


```solidity
function toggleTax() external;
```

### setTaxBeneficiary


```solidity
function setTaxBeneficiary(address taxBeneficiary_) external;
```

### tax


```solidity
function tax(address token_, uint256 amount_) external view returns (uint256);
```

### taxFraction


```solidity
function taxFraction(address token_) external pure returns (uint256);
```

### percentageFraction


```solidity
function percentageFraction() external pure returns (uint256);
```

### isTaxEnabled


```solidity
function isTaxEnabled() external view returns (bool);
```

### taxEnabledDuration


```solidity
function taxEnabledDuration() external pure returns (uint256);
```

## Events
### TaxEnabled

```solidity
event TaxEnabled(
    address indexed operator, uint256 indexed start, uint256 indexed stop
);
```

### TaxBeneficiarySet

```solidity
event TaxBeneficiarySet(
    address indexed operator,
    address indexed oldBeneficiary,
    address indexed newBeneficiary
);
```

## Errors
### Taxable__TaxDisabled

```solidity
error Taxable__TaxDisabled();
```

### Taxable__AlreadyEnabled

```solidity
error Taxable__AlreadyEnabled();
```

### Taxable__InvalidArguments

```solidity
error Taxable__InvalidArguments();
```

