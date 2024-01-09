# Ownable2Step
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/access/Ownable2Step.sol)

**Inherits:**
[Ownable](/src/oz-custom/oz/access/Ownable.sol/abstract.Ownable.md), [IOwnable2Step](/src/oz-custom/oz/access/Ownable2Step.sol/interface.IOwnable2Step.md)

*Contract module which provides access control mechanism, where
there is an account (an owner) that can be granted exclusive access to
specific functions.
By default, the owner account will be the one that deploys the contract. This
can later be changed with {transferOwnership} and {acceptOwnership}.
This module is used through inheritance. It will make available all functions
from parent (Ownable).*


## State Variables
### __pendingOwner

```solidity
bytes32 private __pendingOwner;
```


## Functions
### pendingOwner

*Returns the address of the pending owner.*


```solidity
function pendingOwner() public view virtual returns (address _pendingOwner);
```

### transferOwnership

*Starts the ownership transfer of the contract to a new account.
Replaces the pending transfer if there is
one.
Can only be called by the current owner.*


```solidity
function transferOwnership(address newOwner_)
    public
    virtual
    override
    onlyOwner;
```

### _transferOwnership

*Transfers ownership of the contract to a new account (`newOwner`)
and deletes any pending owner.
Internal function without access restriction.*


```solidity
function _transferOwnership(address newOwner) internal virtual override;
```

### acceptOwnership

*The new owner accepts the ownership transfer.*


```solidity
function acceptOwnership() external;
```

