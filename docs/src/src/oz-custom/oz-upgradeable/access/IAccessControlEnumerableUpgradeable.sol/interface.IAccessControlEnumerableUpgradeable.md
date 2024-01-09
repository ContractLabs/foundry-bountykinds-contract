# IAccessControlEnumerableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/access/IAccessControlEnumerableUpgradeable.sol)

**Inherits:**
[IAccessControlUpgradeable](/src/oz-custom/oz-upgradeable/access/IAccessControlUpgradeable.sol/interface.IAccessControlUpgradeable.md)

*External interface of AccessControlEnumerable declared to support ERC165
detection.*


## Functions
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
    external
    view
    returns (address);
```

### getRoleMemberCount

*Returns the number of accounts that have `role`. Can be used
together with {getRoleMember} to enumerate all bearers of a role.*


```solidity
function getRoleMemberCount(bytes32 role) external view returns (uint256);
```

### getAllRoleMembers


```solidity
function getAllRoleMembers(bytes32 role_)
    external
    view
    returns (address[] memory);
```

