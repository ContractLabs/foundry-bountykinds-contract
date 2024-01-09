# ERC20Upgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC20/ERC20Upgradeable.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ERC165Upgradeable](/src/oz-custom/oz-upgradeable/utils/introspection/ERC165Upgradeable.sol/abstract.ERC165Upgradeable.md), [IERC20Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/IERC20Upgradeable.sol/interface.IERC20Upgradeable.md), [IERC20MetadataUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/IERC20MetadataUpgradeable.sol/interface.IERC20MetadataUpgradeable.md)

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


### __gap
*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
uint256[45] private __gap;
```


## Functions
### __ERC20_init


```solidity
function __ERC20_init(
    string calldata name_,
    string calldata symbol_
)
    internal
    onlyInitializing;
```

### __ERC20_init_unchained


```solidity
function __ERC20_init_unchained(
    string memory name_,
    string memory symbol_
)
    internal
    onlyInitializing;
```

### decimals


```solidity
function decimals() external pure returns (uint8);
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

### supportsInterface

*value is equal to
keccak256("Transfer(address,address,uint256)")*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool);
```

### balanceOf


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

