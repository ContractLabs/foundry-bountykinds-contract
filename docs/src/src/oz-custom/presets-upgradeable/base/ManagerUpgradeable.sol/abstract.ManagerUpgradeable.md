# ManagerUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol)

**Inherits:**
[IManager](/src/oz-custom/presets-upgradeable/base/interfaces/IManager.sol/interface.IManager.md), [UUPSUpgradeable](/src/oz-custom/oz-upgradeable/proxy/utils/UUPSUpgradeable.sol/abstract.UUPSUpgradeable.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ProxyCheckerUpgradeable](/src/oz-custom/internal-upgradeable/ProxyCheckerUpgradeable.sol/abstract.ProxyCheckerUpgradeable.md)


## State Variables
### __authority

```solidity
bytes32 private __authority;
```


### __requestedRole

```solidity
bytes32 private __requestedRole;
```


### __gap

```solidity
uint256[48] private __gap;
```


## Functions
### onlyRole


```solidity
modifier onlyRole(bytes32 role);
```

### onlyWhitelisted


```solidity
modifier onlyWhitelisted();
```

### whenNotPaused


```solidity
modifier whenNotPaused();
```

### whenPaused


```solidity
modifier whenPaused();
```

### __Manager_init


```solidity
function __Manager_init(
    IAuthority authority_,
    bytes32 role_
)
    internal
    onlyInitializing;
```

### __Manager_init_unchained


```solidity
function __Manager_init_unchained(
    IAuthority authority_,
    bytes32 role_
)
    internal
    onlyInitializing;
```

### updateAuthority

Updates the authority of this contract. This can only be done by
an operator.

*The authority contract must allow this contract to have the role
specified in the constructor.*


```solidity
function updateAuthority(IAuthority authority_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`authority_`|`IAuthority`|The new authority contract.|


### authority

Returns the authority contract of this contract.


```solidity
function authority() public view returns (IAuthority);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`IAuthority`|authority_ is The address of the authority contract.|


### _authority

Returns the address of the authority contract, for internal use.

*This function is for internal use only and should not be called by
external contracts.*


```solidity
function _authority() internal view returns (address authority_);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`authority_`|`address`|is the address of the authority contract.|


### _checkBlacklist

Checks if the given account is blacklisted by the authority
contract.

*This function should be called before allowing the given account to
perform certain actions.*


```solidity
function _checkBlacklist(address account_) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to check for blacklisting.|


### _checkBlacklistMulti


```solidity
function _checkBlacklistMulti(address[] memory accounts_) internal view;
```

### _checkRole

Checks if the given account has the given role.

*This function should be called before allowing the given account to
perform certain actions.*


```solidity
function _checkRole(bytes32 role_, address account_) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`role_`|`bytes32`|The role to check for.|
|`account_`|`address`|The address to check for the role.|


### __updateAuthority


```solidity
function __updateAuthority(IAuthority authority_) internal;
```

### _requirePaused


```solidity
function _requirePaused() internal view;
```

### _requireNotPaused


```solidity
function _requireNotPaused() internal view;
```

### _hasRole


```solidity
function _hasRole(
    bytes32 role_,
    address account_
)
    internal
    view
    returns (bool);
```

### __checkAuthority


```solidity
function __checkAuthority(address authority_) private view;
```

### _authorizeUpgrade


```solidity
function _authorizeUpgrade(address implement_)
    internal
    override
    onlyRole(Roles.UPGRADER_ROLE);
```

