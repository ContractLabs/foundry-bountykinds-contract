# AuthorityUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets-upgradeable/AuthorityUpgradeable.sol)

**Inherits:**
[IAuthority](/src/oz-custom/presets/interfaces/IAuthority.sol/interface.IAuthority.md), [UUPSUpgradeable](/src/oz-custom/oz-upgradeable/proxy/utils/UUPSUpgradeable.sol/abstract.UUPSUpgradeable.md), [PausableUpgradeable](/src/oz-custom/oz-upgradeable/security/PausableUpgradeable.sol/abstract.PausableUpgradeable.md), [FundForwarderUpgradeable](/src/oz-custom/internal-upgradeable/FundForwarderUpgradeable.sol/abstract.FundForwarderUpgradeable.md), [BlacklistableUpgradeable](/src/oz-custom/internal-upgradeable/BlacklistableUpgradeable.sol/abstract.BlacklistableUpgradeable.md), [AccessControlEnumerableUpgradeable](/src/oz-custom/oz-upgradeable/access/AccessControlEnumerableUpgradeable.sol/abstract.AccessControlEnumerableUpgradeable.md)


## State Variables
### VERSION
*value is equal to keccak256("Authority_v1")*


```solidity
bytes32 public constant VERSION =
    0x095dd5e04e0f3f5bce98e4ee904d9f7209827187c4201f036596b2f7fdd602e7;
```


### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### changeVault


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.OPERATOR_ROLE);
```

### setRoleAdmin


```solidity
function setRoleAdmin(
    bytes32 role_,
    bytes32 adminRole_
)
    external
    onlyRole(getRoleAdmin(adminRole_));
```

### requestAccess


```solidity
function requestAccess(bytes32 role) external whenNotPaused;
```

### pause


```solidity
function pause() external onlyRole(Roles.PAUSER_ROLE);
```

### unpause


```solidity
function unpause() external onlyRole(Roles.PAUSER_ROLE);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    override
    returns (bool);
```

### setUserStatus

*Set the status of an account to either blacklisted or not
blacklisted.*


```solidity
function setUserStatus(
    address account_,
    bool status_
)
    external
    override
    whenPaused
    onlyRole(Roles.PAUSER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to change the status of.|
|`status_`|`bool`||


### __Authority_init


```solidity
function __Authority_init(
    address admin_,
    bytes32[] calldata roles_,
    address[] calldata operators_
)
    internal
    virtual
    onlyInitializing;
```

### __Authority_init_unchained


```solidity
function __Authority_init_unchained(
    address admin_,
    bytes32[] calldata roles_,
    address[] calldata operators_
)
    internal
    virtual
    onlyInitializing;
```

### _authorizeUpgrade


```solidity
function _authorizeUpgrade(address newImplementation)
    internal
    virtual
    override
    onlyRole(Roles.UPGRADER_ROLE);
```

