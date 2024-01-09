# IWNT
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/token/interfaces/IWNT.sol)

**Inherits:**
[IERC20](/src/oz-custom/oz/token/ERC20/IERC20.sol/interface.IERC20.md)


## Functions
### deposit


```solidity
function deposit() external payable;
```

### withdraw


```solidity
function withdraw(uint256 amount) external;
```

## Events
### Deposit

```solidity
event Deposit(address indexed from, uint256 amount);
```

### Withdrawal

```solidity
event Withdrawal(address indexed to, uint256 amount);
```

