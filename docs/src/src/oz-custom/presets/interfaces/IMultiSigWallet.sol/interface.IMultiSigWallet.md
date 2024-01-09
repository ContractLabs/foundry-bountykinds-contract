# IMultiSigWallet
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/interfaces/IMultiSigWallet.sol)


## Events
### Deposited

```solidity
event Deposited(
    address indexed sender, uint256 indexed amount, uint256 indexed balance
);
```

### TransactionSubmited

```solidity
event TransactionSubmited(
    address indexed owner,
    uint256 indexed txIndex,
    address indexed to,
    uint256 value,
    bytes data
);
```

### ConfirmTransaction

```solidity
event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);
```

### RevokeConfirmation

```solidity
event RevokeConfirmation(address indexed owner, uint256 indexed txIndex);
```

### ExecuteTransaction

```solidity
event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);
```

## Errors
### MultiSigWallet__ConfirmedTx

```solidity
error MultiSigWallet__ConfirmedTx();
```

### MultiSigWallet__UnexistedTx

```solidity
error MultiSigWallet__UnexistedTx();
```

### MultiSigWallet__Unauthorized

```solidity
error MultiSigWallet__Unauthorized();
```

### MultiSigWallet__AlreadyExecutedTx

```solidity
error MultiSigWallet__AlreadyExecutedTx();
```

## Structs
### Transaction

```solidity
struct Transaction {
    address to;
    uint96 value;
    bool executed;
    uint8 numConfirmations;
    bytes data;
}
```

