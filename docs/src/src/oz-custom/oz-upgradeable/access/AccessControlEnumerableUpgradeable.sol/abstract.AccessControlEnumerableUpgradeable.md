# AccessControlEnumerableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/access/AccessControlEnumerableUpgradeable.sol)

**Inherits:**
[AccessControlUpgradeable](/src/oz-custom/oz-upgradeable/access/AccessControlUpgradeable.sol/abstract.AccessControlUpgradeable.md), [IAccessControlEnumerableUpgradeable](/src/oz-custom/oz-upgradeable/access/IAccessControlEnumerableUpgradeable.sol/interface.IAccessControlEnumerableUpgradeable.md)

*Extension of {AccessControl} that allows enumerating the members of each
role.*


## State Variables
### _roleMembers

```solidity
mapping(bytes32 => EnumerableSetUpgradeable.AddressSet) internal _roleMembers;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[49] private __gap;
```


## Functions
### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool);
```

### getAllRoleMembers


```solidity
function getAllRoleMembers(bytes32 role_)
    public
    view
    virtual
    override
    returns (address[] memory);
```

### getRoleMember

*Returns one of the accounts that have `role`. `index` must be a
value between 0 and {getRoleMemberCount}, non-inclusive.
Role bearers are not sorted in any particular way, and their ordering may
change at any point.
WARNING: When using {getRoleMember} and {getRoleMemberCount}, make sure
you perform all queries on the same block. See the following
https://forum.openzeppelin.com/t/iterating-over-elements-on-enumerableset-in-openzeppelin-contracts/2296[forum
post]
for more information.*


```solidity
function getRoleMember(
    bytes32 role,
    uint256 index
)
    public
    view
    virtual
    override
    returns (address);
```

### getRoleMemberCount

*Returns the number of accounts that have `role`. Can be used
together with {getRoleMember} to enumerate all bearers of a role.*


```solidity
function getRoleMemberCount(bytes32 role)
    public
    view
    virtual
    override
    returns (uint256);
```

### _grantRole

*Overload {_grantRole} to track enumerable memberships*


```solidity
function _grantRole(bytes32 role, address account) internal virtual override;
```

### _revokeRole

*Overload {_revokeRole} to track enumerable memberships*


```solidity
function _revokeRole(bytes32 role, address account) internal virtual override;
```

