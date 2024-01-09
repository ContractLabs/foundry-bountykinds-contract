# EnumerableSet256
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/structs/EnumerableSet256.sol)


## Functions
### _contains

*Returns true if the value is in the set. O(1).*


```solidity
function _contains(
    Set storage set,
    uint256 value
)
    private
    view
    returns (uint256);
```

### _add


```solidity
function _add(Set storage set, uint256 value) private returns (bool);
```

### _remove

*Removes a value from a set. O(1).
Returns true if the value was removed from the set, that is if it was
present.*


```solidity
function _remove(Set storage set, uint256 value) private returns (bool);
```

### _length

*Returns the number of values on the set. O(1).*


```solidity
function _length(Set storage set) private view returns (uint256);
```

### _at

*Returns the value stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function _at(Set storage set, uint256 index) private view returns (uint256);
```

### _values

*Return the entire set in an array
WARNING: This operation will copy the entire storage to memory, which can
be quite expensive. This is designed
to mostly be used by view accessors that are queried without any gas
fees. Developers should keep in mind that
this function has an unbounded cost, and using it as part of a
state-changing function may render the function
uncallable if the set grows to a point where copying to memory consumes
too much gas to fit in a block.*


```solidity
function _values(Set storage set) private view returns (uint256[] memory);
```

### add

*Add a value to a set. O(1).
Returns true if the value was added to the set, that is if it was not
already present.*


```solidity
function add(Bytes32Set storage set, bytes32 value) internal returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the value was removed from the set, that is if it was
present.*


```solidity
function remove(
    Bytes32Set storage set,
    bytes32 value
)
    internal
    returns (bool);
```

### contains

*Returns true if the value is in the set. O(1).*


```solidity
function contains(
    Bytes32Set storage set,
    bytes32 value
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of values in the set. O(1).*


```solidity
function length(Bytes32Set storage set) internal view returns (uint256);
```

### at

*Returns the value stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    Bytes32Set storage set,
    uint256 index
)
    internal
    view
    returns (bytes32);
```

### values

*Return the entire set in an array
WARNING: This operation will copy the entire storage to memory, which can
be quite expensive. This is designed
to mostly be used by view accessors that are queried without any gas
fees. Developers should keep in mind that
this function has an unbounded cost, and using it as part of a
state-changing function may render the function
uncallable if the set grows to a point where copying to memory consumes
too much gas to fit in a block.*


```solidity
function values(Bytes32Set storage set)
    internal
    view
    returns (bytes32[] memory res);
```

### add

*Add a value to a set. O(1).
Returns true if the value was added to the set, that is if it was not
already present.*


```solidity
function add(AddressSet storage set, address value) internal returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the value was removed from the set, that is if it was
present.*


```solidity
function remove(
    AddressSet storage set,
    address value
)
    internal
    returns (bool);
```

### contains

*Returns true if the value is in the set. O(1).*


```solidity
function contains(
    AddressSet storage set,
    address value
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of values in the set. O(1).*


```solidity
function length(AddressSet storage set) internal view returns (uint256);
```

### at

*Returns the value stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    AddressSet storage set,
    uint256 index
)
    internal
    view
    returns (address addr);
```

### values

*Return the entire set in an array
WARNING: This operation will copy the entire storage to memory, which can
be quite expensive. This is designed
to mostly be used by view accessors that are queried without any gas
fees. Developers should keep in mind that
this function has an unbounded cost, and using it as part of a
state-changing function may render the function
uncallable if the set grows to a point where copying to memory consumes
too much gas to fit in a block.*


```solidity
function values(AddressSet storage set)
    internal
    view
    returns (address[] memory res);
```

### add

*Add a value to a set. O(1).
Returns true if the value was added to the set, that is if it was not
already present.*


```solidity
function add(UintSet storage set, uint256 value) internal returns (bool);
```

### remove

*Removes a value from a set. O(1).
Returns true if the value was removed from the set, that is if it was
present.*


```solidity
function remove(UintSet storage set, uint256 value) internal returns (bool);
```

### contains

*Returns true if the value is in the set. O(1).*


```solidity
function contains(
    UintSet storage set,
    uint256 value
)
    internal
    view
    returns (bool);
```

### length

*Returns the number of values on the set. O(1).*


```solidity
function length(UintSet storage set) internal view returns (uint256);
```

### at

*Returns the value stored at position `index` in the set. O(1).
Note that there are no guarantees on the ordering of values inside the
array, and it may change when more values are added or removed.
Requirements:
- `index` must be strictly less than {length}.*


```solidity
function at(
    UintSet storage set,
    uint256 index
)
    internal
    view
    returns (uint256);
```

### values

*Return the entire set in an array
WARNING: This operation will copy the entire storage to memory, which can
be quite expensive. This is designed
to mostly be used by view accessors that are queried without any gas
fees. Developers should keep in mind that
this function has an unbounded cost, and using it as part of a
state-changing function may render the function
uncallable if the set grows to a point where copying to memory consumes
too much gas to fit in a block.*


```solidity
function values(UintSet storage set) internal view returns (uint256[] memory);
```

## Structs
### Set

```solidity
struct Set {
    uint8 length;
    BitMap256.BitMap indexMap;
    uint256[256] values;
}
```

### Bytes32Set

```solidity
struct Bytes32Set {
    Set _inner;
}
```

### AddressSet

```solidity
struct AddressSet {
    Set _inner;
}
```

### UintSet

```solidity
struct UintSet {
    Set _inner;
}
```

