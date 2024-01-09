# PMT
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/token/PMT.sol)

**Inherits:**
[ERC20Permit](/src/oz-custom/oz/token/ERC20/extensions/ERC20Permit.sol/abstract.ERC20Permit.md)


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

### mint


```solidity
function mint(address to_, uint256 amount_) external;
```

