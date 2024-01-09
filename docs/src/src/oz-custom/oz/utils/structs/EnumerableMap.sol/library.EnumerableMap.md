# EnumerableMap
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/structs/EnumerableMap.sol)

*Library for managing an enumerable variant of Solidity's
https://solidity.readthedocs.io/en/latest/types.html#mapping-types[`mapping`]
type.
Maps have the following properties:
- Entries are added, removed, and checked for existence in constant time
(O(1)).
- Entries are enumerated in O(n). No guarantees are made on the ordering.
```
contract Example {
// Add the library methods
using EnumerableMap for EnumerableMap.UintToAddressMap;
// Declare a set state variable
EnumerableMap.UintToAddressMap private myMap;
}
```
The following map types are supported:
- `uint256 -> address` (`UintToAddressMap`) since v3.0.0
- `address -> uint256` (`AddressToUintMap`) since v4.6.0
- `bytes32 -> bytes32` (`Bytes32ToBytes32`) since v4.6.0
- `uint256 -> uint256` (`UintToUintMap`) since v4.7.0
- `bytes32 -> uint256` (`Bytes32ToUintMap`) since v4.7.0
[WARNING]
====
Trying to delete such a structure from storage will likely result in data
corruption, rendering the structure
unusable.
See https://github.com/ethereum/solidity/pull/11843[ethereum/solidity#11843]
for more info.
In order to clean an EnumerableMap, you can either remove all elements one
by one or create a fresh instance using
an array of EnumerableMap.
====*


## Functions
### set

*Adds a key-value pair to a map, or updates the value for an existing
key. O(1).
Returns true if the key was added to the map, that is if it was not
already present.*


```solidity
function set(
    Bytes32ToBytes32Map storage map,
    bytes32 key,
    bytes32 value
)
    internal
    returns (bool);
```

### remove

*Removes a key-value pair from a map. O(1).
Returns true if the key was removed from the map, that is if it was
present.*


```solidity
function remove(
    Bytes32ToBytes32Map storage map,
    bytes32 key
)
    internal
    returns (bool);
```

### contains

*Returns true if the key is in the map. O(1).*


```solidity
function contains(
    Bytes32ToBytes32Map storage map,
    bytes32 key
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of key-value pairs in the map. O(1).*


```solidity
function length(Bytes32ToBytes32Map storage map)
    internal
    view
    returns (uint256);
```

### at

*Returns the key-value pair stored at position `index` in the map.
O(1).
Note that there are no guarantees on the ordering of entries inside the
array, and it may change when more entries are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    Bytes32ToBytes32Map storage map,
    uint256 index
)
    internal
    view
    returns (bytes32, bytes32);
```

### tryGet

*Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.*


```solidity
function tryGet(
    Bytes32ToBytes32Map storage map,
    bytes32 key
)
    internal
    view
    returns (bool, bytes32);
```

### get

*Returns the value associated with `key`.  O(1).
Requirements:
- `key` must be in the map.*


```solidity
function get(
    Bytes32ToBytes32Map storage map,
    bytes32 key
)
    internal
    view
    returns (bytes32);
```

### get

*Same as {_get}, with a custom error message when `key` is not in the
map.
CAUTION: This function is deprecated because it requires allocating
memory for the error
message unnecessarily. For custom revert reasons use {_tryGet}.*


```solidity
function get(
    Bytes32ToBytes32Map storage map,
    bytes32 key,
    string memory errorMessage
)
    internal
    view
    returns (bytes32);
```

### set

*Adds a key-value pair to a map, or updates the value for an existing
key. O(1).
Returns true if the key was added to the map, that is if it was not
already present.*


```solidity
function set(
    UintToUintMap storage map,
    uint256 key,
    uint256 value
)
    internal
    returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the key was removed from the map, that is if it was
present.*


```solidity
function remove(
    UintToUintMap storage map,
    uint256 key
)
    internal
    returns (bool);
```

### contains

*Returns true if the key is in the map. O(1).*


```solidity
function contains(
    UintToUintMap storage map,
    uint256 key
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of elements in the map. O(1).*


```solidity
function length(UintToUintMap storage map) internal view returns (uint256);
```

### at

*Returns the element stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    UintToUintMap storage map,
    uint256 index
)
    internal
    view
    returns (uint256, uint256);
```

### tryGet

*Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.*


```solidity
function tryGet(
    UintToUintMap storage map,
    uint256 key
)
    internal
    view
    returns (bool, uint256);
```

### get

*Returns the value associated with `key`.  O(1).
Requirements:
- `key` must be in the map.*


```solidity
function get(
    UintToUintMap storage map,
    uint256 key
)
    internal
    view
    returns (uint256);
```

### get

*Same as {get}, with a custom error message when `key` is not in the
map.
CAUTION: This function is deprecated because it requires allocating
memory for the error
message unnecessarily. For custom revert reasons use {tryGet}.*


```solidity
function get(
    UintToUintMap storage map,
    uint256 key,
    string memory errorMessage
)
    internal
    view
    returns (uint256);
```

### set

*Adds a key-value pair to a map, or updates the value for an existing
key. O(1).
Returns true if the key was added to the map, that is if it was not
already present.*


```solidity
function set(
    UintToAddressMap storage map,
    uint256 key,
    address value
)
    internal
    returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the key was removed from the map, that is if it was
present.*


```solidity
function remove(
    UintToAddressMap storage map,
    uint256 key
)
    internal
    returns (bool);
```

### contains

*Returns true if the key is in the map. O(1).*


```solidity
function contains(
    UintToAddressMap storage map,
    uint256 key
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of elements in the map. O(1).*


```solidity
function length(UintToAddressMap storage map) internal view returns (uint256);
```

### at

*Returns the element stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    UintToAddressMap storage map,
    uint256 index
)
    internal
    view
    returns (uint256, address);
```

### tryGet

*Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.
_Available since v3.4._*


```solidity
function tryGet(
    UintToAddressMap storage map,
    uint256 key
)
    internal
    view
    returns (bool, address);
```

### get

*Returns the value associated with `key`.  O(1).
Requirements:
- `key` must be in the map.*


```solidity
function get(
    UintToAddressMap storage map,
    uint256 key
)
    internal
    view
    returns (address);
```

### get

*Same as {get}, with a custom error message when `key` is not in the
map.
CAUTION: This function is deprecated because it requires allocating
memory for the error
message unnecessarily. For custom revert reasons use {tryGet}.*


```solidity
function get(
    UintToAddressMap storage map,
    uint256 key,
    string memory errorMessage
)
    internal
    view
    returns (address);
```

### set

*Adds a key-value pair to a map, or updates the value for an existing
key. O(1).
Returns true if the key was added to the map, that is if it was not
already present.*


```solidity
function set(
    AddressToUintMap storage map,
    address key,
    uint256 value
)
    internal
    returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the key was removed from the map, that is if it was
present.*


```solidity
function remove(
    AddressToUintMap storage map,
    address key
)
    internal
    returns (bool);
```

### contains

*Returns true if the key is in the map. O(1).*


```solidity
function contains(
    AddressToUintMap storage map,
    address key
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of elements in the map. O(1).*


```solidity
function length(AddressToUintMap storage map) internal view returns (uint256);
```

### at

*Returns the element stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    AddressToUintMap storage map,
    uint256 index
)
    internal
    view
    returns (address, uint256);
```

### tryGet

*Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.*


```solidity
function tryGet(
    AddressToUintMap storage map,
    address key
)
    internal
    view
    returns (bool, uint256);
```

### get

*Returns the value associated with `key`.  O(1).
Requirements:
- `key` must be in the map.*


```solidity
function get(
    AddressToUintMap storage map,
    address key
)
    internal
    view
    returns (uint256);
```

### get

*Same as {get}, with a custom error message when `key` is not in the
map.
CAUTION: This function is deprecated because it requires allocating
memory for the error
message unnecessarily. For custom revert reasons use {tryGet}.*


```solidity
function get(
    AddressToUintMap storage map,
    address key,
    string memory errorMessage
)
    internal
    view
    returns (uint256);
```

### set

*Adds a key-value pair to a map, or updates the value for an existing
key. O(1).
Returns true if the key was added to the map, that is if it was not
already present.*


```solidity
function set(
    Bytes32ToUintMap storage map,
    bytes32 key,
    uint256 value
)
    internal
    returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the key was removed from the map, that is if it was
present.*


```solidity
function remove(
    Bytes32ToUintMap storage map,
    bytes32 key
)
    internal
    returns (bool);
```

### contains

*Returns true if the key is in the map. O(1).*


```solidity
function contains(
    Bytes32ToUintMap storage map,
    bytes32 key
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of elements in the map. O(1).*


```solidity
function length(Bytes32ToUintMap storage map) internal view returns (uint256);
```

### at

*Returns the element stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    Bytes32ToUintMap storage map,
    uint256 index
)
    internal
    view
    returns (bytes32, uint256);
```

### tryGet

*Tries to returns the value associated with `key`.  O(1).
Does not revert if `key` is not in the map.*


```solidity
function tryGet(
    Bytes32ToUintMap storage map,
    bytes32 key
)
    internal
    view
    returns (bool, uint256);
```

### get

*Returns the value associated with `key`.  O(1).
Requirements:
- `key` must be in the map.*


```solidity
function get(
    Bytes32ToUintMap storage map,
    bytes32 key
)
    internal
    view
    returns (uint256);
```

### get

*Same as {get}, with a custom error message when `key` is not in the
map.
CAUTION: This function is deprecated because it requires allocating
memory for the error
message unnecessarily. For custom revert reasons use {tryGet}.*


```solidity
function get(
    Bytes32ToUintMap storage map,
    bytes32 key,
    string memory errorMessage
)
    internal
    view
    returns (uint256);
```

## Structs
### Bytes32ToBytes32Map

```solidity
struct Bytes32ToBytes32Map {
    EnumerableSet.Bytes32Set _keys;
    mapping(bytes32 => bytes32) _values;
}
```

### UintToUintMap

```solidity
struct UintToUintMap {
    Bytes32ToBytes32Map _inner;
}
```

### UintToAddressMap

```solidity
struct UintToAddressMap {
    Bytes32ToBytes32Map _inner;
}
```

### AddressToUintMap

```solidity
struct AddressToUintMap {
    Bytes32ToBytes32Map _inner;
}
```

### Bytes32ToUintMap

```solidity
struct Bytes32ToUintMap {
    Bytes32ToBytes32Map _inner;
}
```

