# WNT
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/token/WNT.sol)

**Inherits:**
[IWNT](/src/oz-custom/presets/token/interfaces/IWNT.sol/interface.IWNT.md), [ERC20Permit](/src/oz-custom/oz/token/ERC20/extensions/ERC20Permit.sol/abstract.ERC20Permit.md), [Transferable](/src/oz-custom/internal/Transferable.sol/abstract.Transferable.md)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/WETH.sol), Inspired by WETH9
(https://github.com/dapphub/ds-weth/blob/master/src/weth9.sol)

Minimalist and modern Wrapped Ether implementation.


## Functions
### constructor


```solidity
constructor(
    string memory name_,
    string memory symbol_
)
    payable
    ERC20Permit(name_, symbol_);
```

### deposit


```solidity
function deposit() public payable virtual;
```

### withdraw


```solidity
function withdraw(uint256 amount) public virtual;
```

### receive


```solidity
receive() external payable virtual;
```

