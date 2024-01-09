# Authority
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/Authority.sol)

**Inherits:**
[Pausable](/src/oz-custom/oz/security/Pausable.sol/abstract.Pausable.md), [Multicall](/src/oz-custom/presets/Multicall.sol/contract.Multicall.md), [IAuthority](/src/oz-custom/presets/interfaces/IAuthority.sol/interface.IAuthority.md), [ProxyChecker](/src/oz-custom/internal/ProxyChecker.sol/abstract.ProxyChecker.md), [Blacklistable](/src/oz-custom/internal/Blacklistable.sol/abstract.Blacklistable.md), [FundForwarder](/src/oz-custom/internal/FundForwarder.sol/abstract.FundForwarder.md), [AccessControlEnumerable](/src/oz-custom/oz/access/AccessControlEnumerable.sol/abstract.AccessControlEnumerable.md)


## State Variables
### VERSION
*value is equal to keccak256("Authority_v1")*


```solidity
bytes32 public constant VERSION =
    0x095dd5e04e0f3f5bce98e4ee904d9f7209827187c4201f036596b2f7fdd602e7;
```


## Functions
### constructor


```solidity
constructor(
    address admin_,
    bytes32[] memory roles_,
    address[] memory operators_
)
    payable
    Pausable;
```

### _multicall


```solidity
function _multicall(
    CallData[] calldata calldata_,
    bytes calldata extraData_
)
    internal
    override
    onlyRole(DEFAULT_ADMIN_ROLE)
    nonDelegatecall
    nonReentrant
    returns (bytes[] memory results);
```

### changeVault


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.OPERATOR_ROLE);
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
    onlyRole(Roles.PAUSER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address to change the status of.|
|`status_`|`bool`||


### setRoleAdmin

*Sets the admin of the specified role to the specified admin role.*


```solidity
function setRoleAdmin(
    bytes32 role,
    bytes32 adminRole
)
    external
    onlyRole(getRoleAdmin(adminRole));
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`role`|`bytes32`|bytes32 representing the role to set the admin of|
|`adminRole`|`bytes32`|bytes32 representing the role to set as the admin of the role|


### pause

*Pauses all functions in the contract. Only callable by accounts with
the PAUSER_ROLE.*


```solidity
function pause() external onlyRole(Roles.PAUSER_ROLE);
```

### unpause

*Unpauses all functions in the contract. Only callable by accounts
with the PAUSER_ROLE.*


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

### requestAccess

*Allows a user to request access to the contract as a proxy.
Only callable by accounts with the OPERATOR_ROLE and only if the sender
is a proxy of the caller.
Grants the PROXY_ROLE and the specified role to the sender.*


```solidity
function requestAccess(bytes32 role) external whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`role`|`bytes32`|bytes32 representing the role to grant to the sender in addition to the PROXY_ROLE|


