# ERC20PausableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol)

**Inherits:**
[ERC20Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/ERC20Upgradeable.sol/abstract.ERC20Upgradeable.md), [PausableUpgradeable](/src/oz-custom/oz-upgradeable/security/PausableUpgradeable.sol/abstract.PausableUpgradeable.md)

*ERC20 token with pausable token transfers, minting and burning.
Useful for scenarios such as preventing trades until the end of an evaluation
period, or having an emergency switch for freezing all token transfers in the
event of a large bug.*


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### __ERC20Pausable_init


```solidity
function __ERC20Pausable_init() internal onlyInitializing;
```

### _beforeTokenTransfer

*See {ERC20-_beforeTokenTransfer}.
Requirements:
- the contract must not be paused.*


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
)
    internal
    virtual
    override
    whenNotPaused;
```

