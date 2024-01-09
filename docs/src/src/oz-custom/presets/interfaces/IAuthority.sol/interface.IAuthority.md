# IAuthority
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/interfaces/IAuthority.sol)


## Functions
### setRoleAdmin

*Sets the admin of the specified role to the specified admin role.*


```solidity
function setRoleAdmin(bytes32 role, bytes32 adminRole) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`role`|`bytes32`|bytes32 representing the role to set the admin of|
|`adminRole`|`bytes32`|bytes32 representing the role to set as the admin of the role|


### requestAccess

*Allows a user to request access to the contract as a proxy.
Only callable by accounts with the OPERATOR_ROLE and only if the sender
is a proxy of the caller.
Grants the PROXY_ROLE and the specified role to the sender.*


```solidity
function requestAccess(bytes32 role) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`role`|`bytes32`|bytes32 representing the role to grant to the sender in addition to the PROXY_ROLE|


## Events
### VaultMultiUpdated

```solidity
event VaultMultiUpdated(
    address indexed operator, address indexed vault, bool[] success
);
```

### ProxyAccessGranted

```solidity
event ProxyAccessGranted(address indexed operator, address indexed proxy);
```

## Errors
### Authority__InvalidRole

```solidity
error Authority__InvalidRole();
```

### Authority__LengthMismatch

```solidity
error Authority__LengthMismatch();
```

