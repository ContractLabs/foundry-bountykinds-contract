# ITreasury
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/interfaces/ITreasury.sol)


## Functions
### withdraw


```solidity
function withdraw(
    address token_,
    address to_,
    uint256 value_,
    uint256 amount_,
    uint256 deadline_,
    bytes calldata signature_
)
    external;
```

### nonces


```solidity
function nonces(address account_) external view returns (uint256);
```

## Events
### BalanceInitiated

```solidity
event BalanceInitiated(address indexed operator, uint256 indexed balance);
```

## Errors
### Treasury__Expired

```solidity
error Treasury__Expired();
```

### Treasury__LengthMismatch

```solidity
error Treasury__LengthMismatch();
```

### Treasury__InvalidBalance

```solidity
error Treasury__InvalidBalance();
```

### Treasury__InvalidArgument

```solidity
error Treasury__InvalidArgument();
```

### Treasury__InvalidSignature

```solidity
error Treasury__InvalidSignature();
```

### Treasury__MistakenTransfer

```solidity
error Treasury__MistakenTransfer();
```

### Treasury__InvalidTokenAddress

```solidity
error Treasury__InvalidTokenAddress();
```

### Treasury__InvalidFunctionCall

```solidity
error Treasury__InvalidFunctionCall();
```

### Treasury__UnauthorizedWithdrawal

```solidity
error Treasury__UnauthorizedWithdrawal();
```

