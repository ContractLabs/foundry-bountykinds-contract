# OwnableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/access/OwnableUpgradeable.sol)

**Inherits:**
[IOwnableUpgradeable](/src/oz-custom/oz-upgradeable/access/OwnableUpgradeable.sol/interface.IOwnableUpgradeable.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md)

*Contract module which provides a basic access control mechanism, where
there is an account (an owner) that can be granted exclusive access to
specific functions.
By default, the owner account will be the one that deploys the contract. This
can later be changed with {transferOwnership}.
This module is used through inheritance. It will make available the modifier
`onlyOwner`, which can be applied to your functions to restrict their use to
the owner.*


## State Variables
### __owner

```solidity
bytes32 private __owner;
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
### __Ownable_init

*Initializes the contract setting the deployer as the initial owner.*


```solidity
function __Ownable_init() internal onlyInitializing;
```

### __Ownable_init_unchained


```solidity
function __Ownable_init_unchained() internal onlyInitializing;
```

### onlyOwner

*Throws if called by any account other than the owner.*


```solidity
modifier onlyOwner();
```

### owner

*Returns the address of the current owner.*


```solidity
function owner() public view virtual returns (address);
```

### _checkOwner

*Throws if the sender is not the owner.*


```solidity
function _checkOwner(address sender_) internal view virtual;
```

### renounceOwnership

*Leaves the contract without owner. It will not be possible to call
`onlyOwner` functions anymore. Can only be called by the current owner.
NOTE: Renouncing ownership will leave the contract without an owner,
thereby removing any functionality that is only available to the owner.*


```solidity
function renounceOwnership() public virtual onlyOwner;
```

### transferOwnership

*Transfers ownership of the contract to a new account (`newOwner`).
Can only be called by the current owner.*


```solidity
function transferOwnership(address newOwner) public virtual onlyOwner;
```

### _transferOwnership

*Transfers ownership of the contract to a new account (`newOwner`).
Internal function without access restriction.*


```solidity
function _transferOwnership(address newOwner) internal virtual;
```

