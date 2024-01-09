# IPausable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/security/Pausable.sol)


## Functions
### pause

*Pauses all functions in the contract. Only callable by accounts with
the PAUSER_ROLE.*


```solidity
function pause() external;
```

### unpause

*Unpauses all functions in the contract. Only callable by accounts
with the PAUSER_ROLE.*


```solidity
function unpause() external;
```

### paused


```solidity
function paused() external view returns (bool isPaused);
```

## Events
### Paused
*Emitted when the pause is triggered by `account`.*


```solidity
event Paused(address indexed account);
```

### Unpaused
*Emitted when the pause is lifted by `account`.*


```solidity
event Unpaused(address indexed account);
```

## Errors
### Pausable__Paused

```solidity
error Pausable__Paused();
```

### Pausable__NotPaused

```solidity
error Pausable__NotPaused();
```

