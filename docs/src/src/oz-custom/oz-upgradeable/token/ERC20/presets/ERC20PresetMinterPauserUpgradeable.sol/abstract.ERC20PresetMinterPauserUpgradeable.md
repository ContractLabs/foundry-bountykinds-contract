# ERC20PresetMinterPauserUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol)

**Inherits:**
[ERC20BurnableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol/abstract.ERC20BurnableUpgradeable.md), [ERC20PausableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol/abstract.ERC20PausableUpgradeable.md), [AccessControlEnumerableUpgradeable](/src/oz-custom/oz-upgradeable/access/AccessControlEnumerableUpgradeable.sol/abstract.AccessControlEnumerableUpgradeable.md)

*{ERC20} token, including:
- ability for holders to burn (destroy) their tokens
- a minter role that allows for token minting (creation)
- a pauser role that allows to stop all token transfers
This contract uses {AccessControl} to lock permissioned functions using the
different roles - head to its documentation for details.
The account that deploys the contract will be granted the minter and pauser
roles, as well as the default admin role, which will let it grant both minter
and pauser roles to other accounts.
_Deprecated in favor of https://wizard.openzeppelin.com/[Contracts Wizard]._*


## State Variables
### MINTER_ROLE
*value is equal to keccak256("MINTER_ROLE")*


```solidity
bytes32 public constant MINTER_ROLE =
    0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6;
```


### PAUSER_ROLE
*value is equal to keccak256("PAUSER_ROLE")*


```solidity
bytes32 public constant PAUSER_ROLE =
    0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a;
```


### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### __ERC20PresetMinterPauser_init

*Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE` and `PAUSER_ROLE` to the
account that deploys the contract.
See {ERC20-constructor}.*


```solidity
function __ERC20PresetMinterPauser_init(
    string calldata name_,
    string calldata symbol_
)
    internal
    onlyInitializing;
```

### __ERC20PresetMinterPauser_init_unchained


```solidity
function __ERC20PresetMinterPauser_init_unchained() internal onlyInitializing;
```

### mint

*Creates `amount` new tokens for `to`.
See {ERC20-_mint}.
Requirements:
- the caller must have the `MINTER_ROLE`.*


```solidity
function mint(
    address to,
    uint256 amount
)
    external
    virtual
    onlyRole(MINTER_ROLE);
```

### pause

*Pauses all token transfers.
See {ERC20Pausable} and {Pausable-_pause}.
Requirements:
- the caller must have the `PAUSER_ROLE`.*


```solidity
function pause() external virtual onlyRole(PAUSER_ROLE);
```

### unpause

*Unpauses all token transfers.
See {ERC20Pausable} and {Pausable-_unpause}.
Requirements:
- the caller must have the `PAUSER_ROLE`.*


```solidity
function unpause() external virtual onlyRole(PAUSER_ROLE);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    override(ERC20Upgradeable, AccessControlEnumerableUpgradeable)
    returns (bool);
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from,
    address to,
    uint256 amount
)
    internal
    virtual
    override(ERC20Upgradeable, ERC20PausableUpgradeable);
```

