# IERC20Metadata
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC20/extensions/IERC20Metadata.sol)

**Inherits:**
[IERC20](/src/oz-custom/oz/token/ERC20/IERC20.sol/interface.IERC20.md)

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

