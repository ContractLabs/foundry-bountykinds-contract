# ERC20
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC20/ERC20.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [IERC20](/src/oz-custom/oz/token/ERC20/IERC20.sol/interface.IERC20.md), [IERC20Metadata](/src/oz-custom/oz/token/ERC20/extensions/IERC20Metadata.sol/interface.IERC20Metadata.md)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC20.sol), Modified from Uniswap
(https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/UniswapV2ERC20.sol)

Modern and gas efficient ERC20 + EIP-2612 implementation.

*Do not manually set balances without updating totalSupply, as the sum
of all user balances must not exceed it.*


## State Variables
### totalSupply

```solidity
uint256 public totalSupply;
```


### name

```solidity
string public name;
```


### symbol

```solidity
string public symbol;
```


### _balanceOf

```solidity
mapping(address => uint256) internal _balanceOf;
```


### _allowance

```solidity
mapping(address => mapping(address => uint256)) internal _allowance;
```


## Functions
### constructor


```solidity
constructor(string memory name_, string memory symbol_) payable;
```

### decimals

*Returns the number of decimals used to get its user representation.
For example, if `decimals` equals `2`, a balance of `505` tokens should
be displayed to a user as `5.05` (`505 / 10 ** 2`).
Tokens usually opt for a value of 18, imitating the relationship between
Ether and Wei. This is the value {ERC20} uses, unless this function is
overridden;
NOTE: This information is only used for _display_ purposes: it in
no way affects any of the arithmetic of the contract, including
{IERC20-balanceOf} and {IERC20-transfer}.*


```solidity
function decimals() public pure virtual returns (uint8);
```

### approve


```solidity
function approve(
    address spender,
    uint256 amount
)
    public
    virtual
    returns (bool approved);
```

### transfer

*value is equal to
keccak256("Approval(address,address,uint256)")*


```solidity
function transfer(address to, uint256 amount) public virtual returns (bool);
```

### transferFrom

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function transferFrom(
    address from,
    address to,
    uint256 amount
)
    public
    virtual
    returns (bool);
```

### balanceOf

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function balanceOf(address account)
    external
    view
    override
    returns (uint256 _balance);
```

### allowance


```solidity
function allowance(
    address owner,
    address spender
)
    external
    view
    override
    returns (uint256 allowance_);
```

### _spendAllowance


```solidity
function _spendAllowance(
    address owner_,
    address spender_,
    uint256 amount_
)
    internal
    virtual;
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
)
    internal
    virtual;
```

### _afterTokenTransfer


```solidity
function _afterTokenTransfer(
    address from,
    address to,
    uint256 amount
)
    internal
    virtual;
```

### _mint


```solidity
function _mint(address to, uint256 amount) internal virtual;
```

### _burn

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function _burn(address from, uint256 amount) internal virtual;
```

