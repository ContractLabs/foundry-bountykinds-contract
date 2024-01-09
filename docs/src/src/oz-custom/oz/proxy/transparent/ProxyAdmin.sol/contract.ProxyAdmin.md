# ProxyAdmin
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/proxy/transparent/ProxyAdmin.sol)

**Inherits:**
[Ownable](/src/oz-custom/oz/access/Ownable.sol/abstract.Ownable.md)

*This is an auxiliary contract meant to be assigned as the admin of a
{TransparentUpgradeableProxy}. For an
explanation of why you would want to use this see the documentation for
{TransparentUpgradeableProxy}.*


## Functions
### getProxyImplementation

*Returns the current implementation of `proxy`.
Requirements:
- This contract must be the admin of `proxy`.*


```solidity
function getProxyImplementation(TransparentUpgradeableProxy proxy)
    public
    view
    virtual
    returns (address);
```

### getProxyAdmin

*Returns the current admin of `proxy`.
Requirements:
- This contract must be the admin of `proxy`.*


```solidity
function getProxyAdmin(TransparentUpgradeableProxy proxy)
    public
    view
    virtual
    returns (address);
```

### changeProxyAdmin

*Changes the admin of `proxy` to `newAdmin`.
Requirements:
- This contract must be the current admin of `proxy`.*


```solidity
function changeProxyAdmin(
    TransparentUpgradeableProxy proxy,
    address newAdmin
)
    public
    virtual
    onlyOwner;
```

### upgrade

*Upgrades `proxy` to `implementation`. See
{TransparentUpgradeableProxy-upgradeTo}.
Requirements:
- This contract must be the admin of `proxy`.*


```solidity
function upgrade(
    TransparentUpgradeableProxy proxy,
    address implementation
)
    public
    virtual
    onlyOwner;
```

### upgradeAndCall

*Upgrades `proxy` to `implementation` and calls a function on the new
implementation. See
{TransparentUpgradeableProxy-upgradeToAndCall}.
Requirements:
- This contract must be the admin of `proxy`.*


```solidity
function upgradeAndCall(
    TransparentUpgradeableProxy proxy,
    address implementation,
    bytes calldata data
)
    public
    payable
    virtual
    onlyOwner;
```

