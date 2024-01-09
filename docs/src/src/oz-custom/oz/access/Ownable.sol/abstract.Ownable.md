# Ownable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/access/Ownable.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [IOwnable](/src/oz-custom/oz/access/Ownable.sol/interface.IOwnable.md)

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


## Functions
### onlyOwner

*Throws if called by any account other than the owner.*


```solidity
modifier onlyOwner();
```

### constructor

*Initializes the contract setting the deployer as the initial owner.*


```solidity
constructor() payable;
```

### owner

*Returns the address of the current owner.*


```solidity
function owner() public view virtual returns (address _owner);
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

