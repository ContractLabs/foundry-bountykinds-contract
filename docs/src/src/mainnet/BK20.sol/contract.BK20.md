# BK20
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BK20.sol)

**Inherits:**
[IBK20](/src/interfaces/IBK20.sol/interface.IBK20.md), [UUPSUpgradeable](/src/oz-custom/oz-upgradeable/proxy/utils/UUPSUpgradeable.sol/abstract.UUPSUpgradeable.md), [ERC20PermitUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol/abstract.ERC20PermitUpgradeable.md), [TransferableUpgradeable](/src/oz-custom/internal-upgradeable/TransferableUpgradeable.sol/abstract.TransferableUpgradeable.md), [ProxyCheckerUpgradeable](/src/oz-custom/internal-upgradeable/ProxyCheckerUpgradeable.sol/abstract.ProxyCheckerUpgradeable.md), [BlacklistableUpgradeable](/src/oz-custom/internal-upgradeable/BlacklistableUpgradeable.sol/abstract.BlacklistableUpgradeable.md), [ERC20BurnableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol/abstract.ERC20BurnableUpgradeable.md), [ERC20PausableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol/abstract.ERC20PausableUpgradeable.md), [AccessControlEnumerableUpgradeable](/src/oz-custom/oz-upgradeable/access/AccessControlEnumerableUpgradeable.sol/abstract.AccessControlEnumerableUpgradeable.md)


## State Variables
### PAUSER_ROLE

```solidity
bytes32 public constant PAUSER_ROLE =
    0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a;
```


### MINTER_ROLE

```solidity
bytes32 public constant MINTER_ROLE =
    0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6;
```


### OPERATOR_ROLE

```solidity
bytes32 public constant OPERATOR_ROLE =
    0x97667070c54ef182b0f5858b034beac1b6f3089aa2d3188bb1e8929f4fa9b929;
```


### UPGRADER_ROLE

```solidity
bytes32 public constant UPGRADER_ROLE =
    0x189ab7a9244df0848122154315af71fe140f3db0fe014031783b0946b8c9d2e3;
```


### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    address admin_,
    uint256 initialSupply_,
    string calldata name_,
    string calldata symbol_
)
    external
    initializer;
```

### setUserStatus


```solidity
function setUserStatus(
    address account_,
    bool status_
)
    external
    onlyRole(OPERATOR_ROLE);
```

### pause


```solidity
function pause() external onlyRole(PAUSER_ROLE);
```

### unpause


```solidity
function unpause() external onlyRole(PAUSER_ROLE);
```

### mint

*Mints tokens to the specified address.*


```solidity
function mint(address to_, uint256 amount_) external onlyRole(MINTER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address that will receive the tokens.|
|`amount_`|`uint256`|The amount of tokens to mint.|


### execute

*Executes a call to an external contract.*


```solidity
function execute(
    address target_,
    uint256 value_,
    bytes calldata calldata_
)
    external
    whenPaused
    onlyRole(OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`target_`|`address`|The address of the external contract to call.|
|`value_`|`uint256`|The amount of ether to send with the call.|
|`calldata_`|`bytes`|The data to send with the call.|


### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 amount_
)
    internal
    override(ERC20Upgradeable, ERC20PausableUpgradeable);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(AccessControlEnumerableUpgradeable, ERC20Upgradeable)
    returns (bool);
```

### _authorizeUpgrade


```solidity
function _authorizeUpgrade(address newImplementation)
    internal
    virtual
    override
    onlyRole(UPGRADER_ROLE);
```

