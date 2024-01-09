# PausableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/security/PausableUpgradeable.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [IPausableUpgradeable](/src/oz-custom/oz-upgradeable/security/PausableUpgradeable.sol/interface.IPausableUpgradeable.md)

*Contract module which allows children to implement an emergency stop
mechanism that can be triggered by an authorized account.
This module is used through inheritance. It will make available the
modifiers `whenNotPaused` and `whenPaused`, which can be applied to
the functions of your contract. Note that they will not be pausable by
simply including this module, only once the modifiers are put in place.*


## State Variables
### __paused

```solidity
uint256 private __paused;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[49] private __gap;
```


## Functions
### __Pausable_init

*Initializes the contract in unpaused state.*


```solidity
function __Pausable_init() internal onlyInitializing;
```

### __Pausable_init_unchained


```solidity
function __Pausable_init_unchained() internal onlyInitializing;
```

### whenNotPaused

*Modifier to make a function callable only when the contract is not
paused.
Requirements:
- The contract must not be paused.*


```solidity
modifier whenNotPaused();
```

### whenPaused

*Modifier to make a function callable only when the contract is
paused.
Requirements:
- The contract must be paused.*


```solidity
modifier whenPaused();
```

### paused

*Returns true if the contract is paused, and false otherwise.*


```solidity
function paused() public view virtual returns (bool isPaused);
```

### _requireNotPaused

*Throws if the contract is paused.*


```solidity
function _requireNotPaused() internal view virtual;
```

### _requirePaused

*Throws if the contract is not paused.*


```solidity
function _requirePaused() internal view virtual;
```

### _pause

*Triggers stopped state.
Requirements:
- The contract must not be paused.*


```solidity
function _pause() internal virtual;
```

### _unpause

*Returns to normal state.
Requirements:
- The contract must be paused.*


```solidity
function _unpause() internal virtual;
```

