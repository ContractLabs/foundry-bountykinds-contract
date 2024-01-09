# UUPSUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/proxy/utils/UUPSUpgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md), [ERC1967UpgradeUpgradeable](/src/oz-custom/oz-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol/abstract.ERC1967UpgradeUpgradeable.md), [IERC1822ProxiableUpgradeable](/src/oz-custom/oz-upgradeable/interfaces/draft-IERC1822Upgradeable.sol/interface.IERC1822ProxiableUpgradeable.md)

*An upgradeability mechanism designed for UUPS proxies. The functions
included here can perform an upgrade of an
{ERC1967Proxy}, when this contract is set as the implementation behind such a
proxy.
A security mechanism ensures that an upgrade does not turn off upgradeability
accidentally, although this risk is
reinstated if the upgrade retains upgradeability but removes the security
mechanism, e.g. by replacing
`UUPSUpgradeable` with a custom implementation of upgrades.
The {_authorizeUpgrade} function must be overridden to include access
restriction to the upgrade mechanism.
_Available since v4.1._*


## State Variables
### __self

```solidity
address private immutable __self = address(this);
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[50] private __gap;
```


## Functions
### __UUPSUpgradeable_init


```solidity
function __UUPSUpgradeable_init() internal onlyInitializing;
```

### __UUPSUpgradeable_init_unchained


```solidity
function __UUPSUpgradeable_init_unchained() internal onlyInitializing;
```

### onlyProxy

*Check that the execution is being performed through a delegatecall
call and that the execution context is
a proxy contract with an implementation (as defined in ERC1967) pointing
to self. This should only be the case
for UUPS and transparent proxies that are using the current contract as
their implementation. Execution of a
function through ERC1167 minimal proxies (clones) would not normally pass
this test, but is not guaranteed to
fail.*


```solidity
modifier onlyProxy();
```

### notDelegated

*Check that the execution is not being performed through a delegate
call. This allows a function to be
callable on the implementing contract but not through proxies.*


```solidity
modifier notDelegated();
```

### proxiableUUID

*Implementation of the ERC1822 {proxiableUUID} function. This returns
the storage slot used by the
implementation. It is used to validate that the this implementation
remains valid after an upgrade.
IMPORTANT: A proxy pointing at a proxiable contract should not be
considered proxiable itself, because this risks
bricking a proxy that upgrades to it, by delegating to itself until out
of gas. Thus it is critical that this
function revert if invoked through a proxy. This is guaranteed by the
`notDelegated` modifier.*


```solidity
function proxiableUUID()
    external
    view
    virtual
    override
    notDelegated
    returns (bytes32);
```

### upgradeTo

*Upgrade the implementation of the proxy to `newImplementation`.
Calls {_authorizeUpgrade}.
Emits an {Upgraded} event.*


```solidity
function upgradeTo(address newImplementation) external virtual onlyProxy;
```

### upgradeToAndCall

*Upgrade the implementation of the proxy to `newImplementation`, and
subsequently execute the function call
encoded in `data`.
Calls {_authorizeUpgrade}.
Emits an {Upgraded} event.*


```solidity
function upgradeToAndCall(
    address newImplementation,
    bytes memory data
)
    external
    payable
    virtual
    onlyProxy;
```

### _authorizeUpgrade

*Function that should revert when `msg.sender` is not authorized to
upgrade the contract. Called by
{upgradeTo} and {upgradeToAndCall}.
Normally, this function will use an xref:access.adoc[access control]
modifier such as {Ownable-onlyOwner}.
```solidity
function _authorizeUpgrade(address) internal override onlyOwner {}
```*


```solidity
function _authorizeUpgrade(address newImplementation) internal virtual;
```

### __checkProxy


```solidity
function __checkProxy() private view;
```

### __checkDelegated


```solidity
function __checkDelegated() private view;
```

