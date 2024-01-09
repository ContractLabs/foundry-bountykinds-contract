# IManager
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets-upgradeable/base/interfaces/IManager.sol)


## Functions
### updateAuthority

Updates the authority of this contract. This can only be done by
an operator.

*The authority contract must allow this contract to have the role
specified in the constructor.*


```solidity
function updateAuthority(IAuthority authority_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`authority_`|`IAuthority`|The new authority contract.|


### authority

Returns the authority contract of this contract.


```solidity
function authority() external view returns (IAuthority authority_);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`authority_`|`IAuthority`|is The address of the authority contract.|


## Events
### AuthorityUpdated

```solidity
event AuthorityUpdated(
    address indexed operator, IAuthority indexed from, IAuthority indexed to
);
```

### RequestRoleCached

```solidity
event RequestRoleCached(address indexed operator, bytes32 indexed role);
```

## Errors
### Manager__Paused

```solidity
error Manager__Paused();
```

### Manager__NotPaused

```solidity
error Manager__NotPaused();
```

### Manager__AlreadySet

```solidity
error Manager__AlreadySet();
```

### Manager__Blacklisted

```solidity
error Manager__Blacklisted();
```

### Manager__Unauthorized

```solidity
error Manager__Unauthorized();
```

### Manager__RequestFailed

```solidity
error Manager__RequestFailed();
```

### Manager__InvalidArgument

```solidity
error Manager__InvalidArgument();
```

### Manager__ExecutionFailed

```solidity
error Manager__ExecutionFailed();
```

