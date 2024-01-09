# BKAuthority
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BKAuthority.sol)

**Inherits:**
[AuthorityUpgradeable](/src/oz-custom/presets-upgradeable/AuthorityUpgradeable.sol/abstract.AuthorityUpgradeable.md), [BKFundForwarderUpgradeable](/src/internal-upgradeable/BKFundForwarderUpgradeable.sol/abstract.BKFundForwarderUpgradeable.md)


## State Variables
### __gap

```solidity
uint256[50] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    address admin_,
    bytes32[] calldata roles_,
    address[] calldata operators_
)
    external
    initializer;
```

### __BKAuthority_init_unchained


```solidity
function __BKAuthority_init_unchained() internal onlyInitializing;
```

### _grantRole


```solidity
function _grantRole(bytes32 role_, address account_) internal override;
```

### _beforeRecover


```solidity
function _beforeRecover(bytes memory)
    internal
    override
    onlyRole(Roles.OPERATOR_ROLE)
    whenPaused;
```

### _afterRecover


```solidity
function _afterRecover(
    address,
    address,
    uint256,
    bytes memory
)
    internal
    override;
```

### _checkValidAddress

*value is equal keccak256("SAFE_TRANSFER")*


```solidity
function _checkValidAddress(address vault_)
    internal
    view
    override(BKFundForwarderUpgradeable, FundForwarderUpgradeable);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|The address of the vault.|


