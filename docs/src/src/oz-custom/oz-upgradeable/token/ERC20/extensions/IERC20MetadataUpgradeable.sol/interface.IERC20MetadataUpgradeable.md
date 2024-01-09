# IERC20MetadataUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol)

**Inherits:**
[IERC20Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/IERC20Upgradeable.sol/interface.IERC20Upgradeable.md)

*Interface for the optional metadata functions from the ERC20 standard.
_Available since v4.1._*


## Functions
### name

*Returns the name of the token.*


```solidity
function name() external view returns (string memory);
```

### symbol

*Returns the symbol of the token.*


```solidity
function symbol() external view returns (string memory);
```

### decimals

*Returns the decimals places of the token.*


```solidity
function decimals() external view returns (uint8);
```

