# ERC20BurnableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol)

**Inherits:**
[ERC20Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/ERC20Upgradeable.sol/abstract.ERC20Upgradeable.md), [IERC721BurnableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol/interface.IERC721BurnableUpgradeable.md)

*Extension of {ERC20} that allows token holders to destroy both their own
tokens and those that they have an allowance for, in a way that can be
recognized off-chain (via event analysis).*


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### burn

*Destroys `amount` tokens from the caller.
See {ERC20-_burn}.*


```solidity
function burn(uint256 amount) external virtual;
```

### burnFrom

*Destroys `amount` tokens from `account`, deducting from the caller's
allowance.
See {ERC20-_burn} and {ERC20-allowance}.
Requirements:
- the caller must have allowance for ``accounts``'s tokens of at least
`amount`.*


```solidity
function burnFrom(address account, uint256 amount) external virtual;
```

