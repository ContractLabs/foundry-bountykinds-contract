# ERC1967UpgradeUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md)

*This abstract contract provides getters and event emitting update
functions for
https://eips.ethereum.org/EIPS/eip-1967[EIP1967] slots.
_Available since v4.1._*


## State Variables
### __ROLLBACK_SLOT

```solidity
bytes32 private constant __ROLLBACK_SLOT =
    0x4910fdfa16fed3260ed0e7147f7cc6da11a60208b5b9406d12a635614ffd9143;
```


### _IMPLEMENTATION_SLOT
*Storage slot with the address of the current implementation.
This is the keccak-256 hash of "eip1967.proxy.implementation" subtracted
by 1, and is
validated in the constructor.*


```solidity
bytes32 internal constant _IMPLEMENTATION_SLOT =
    0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;
```


### _ADMIN_SLOT
*Storage slot with the admin of the contract.
This is the keccak-256 hash of "eip1967.proxy.admin" subtracted by 1, and
is
validated in the constructor.*


```solidity
bytes32 internal constant _ADMIN_SLOT =
    0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;
```


### _BEACON_SLOT
*The storage slot of the UpgradeableBeacon contract which defines the
implementation for this proxy.
This is bytes32(uint256(keccak256('eip1967.proxy.beacon')) - 1)) and is
validated in the constructor.*


```solidity
bytes32 internal constant _BEACON_SLOT =
    0xa3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50;
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
### _getImplementation

*Returns the current implementation address.*


```solidity
function _getImplementation() internal view returns (address);
```

### _setImplementation

*Stores a new address in the EIP1967 implementation slot.*


```solidity
function _setImplementation(address newImplementation) private;
```

### _upgradeTo

*Perform implementation upgrade
Emits an {Upgraded} event.*


```solidity
function _upgradeTo(address newImplementation) internal;
```

### _upgradeToAndCall

*Perform implementation upgrade with additional setup call.
Emits an {Upgraded} event.*


```solidity
function _upgradeToAndCall(
    address newImplementation,
    bytes memory data,
    bool forceCall
)
    internal;
```

### _upgradeToAndCallUUPS

*Perform implementation upgrade with security checks for UUPS
proxies, and additional setup call.
Emits an {Upgraded} event.*


```solidity
function _upgradeToAndCallUUPS(
    address newImplementation,
    bytes memory data,
    bool forceCall
)
    internal;
```

### _getAdmin

*Returns the current admin.*


```solidity
function _getAdmin() internal view returns (address);
```

### _setAdmin

*Stores a new address in the EIP1967 admin slot.*


```solidity
function _setAdmin(address newAdmin) private;
```

### _changeAdmin

*Changes the admin of the proxy.
Emits an {AdminChanged} event.*


```solidity
function _changeAdmin(address newAdmin) internal;
```

### _getBeacon

*Returns the current beacon.*


```solidity
function _getBeacon() internal view returns (address);
```

### _setBeacon

*Stores a new beacon in the EIP1967 beacon slot.*


```solidity
function _setBeacon(address newBeacon) private;
```

### _upgradeBeaconToAndCall

*Perform beacon upgrade with additional setup call. Note: This
upgrades the address of the beacon, it does
not upgrade the implementation contained in the beacon (see
{UpgradeableBeacon-_setImplementation} for that).
Emits a {BeaconUpgraded} event.*


```solidity
function _upgradeBeaconToAndCall(
    address newBeacon,
    bytes calldata data,
    bool forceCall
)
    internal;
```

### _functionDelegateCall

*Same as
{xref-Address-functionCall-address-bytes-string-}[`functionCall`],
but performing a delegate call.
_Available since v3.4._*


```solidity
function _functionDelegateCall(
    address target,
    bytes memory data
)
    private
    returns (bytes memory);
```

### _isContract


```solidity
function _isContract(address addr_) internal view returns (bool);
```

### _verifyCallResult


```solidity
function _verifyCallResult(
    bool success,
    bytes memory returndata
)
    internal
    pure
    returns (bytes memory);
```

## Events
### Upgraded
*Emitted when the implementation is upgraded.*


```solidity
event Upgraded(address indexed implementation);
```

### AdminChanged
*Emitted when the admin account has changed.*


```solidity
event AdminChanged(address previousAdmin, address newAdmin);
```

### BeaconUpgraded
*Emitted when the beacon is upgraded.*


```solidity
event BeaconUpgraded(address indexed beacon);
```

