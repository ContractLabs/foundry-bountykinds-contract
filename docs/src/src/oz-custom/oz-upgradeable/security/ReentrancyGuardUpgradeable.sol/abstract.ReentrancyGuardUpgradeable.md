# ReentrancyGuardUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/security/ReentrancyGuardUpgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md)

*Contract module that helps prevent reentrant calls to a function.
Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
available, which can be applied to functions to make sure there are no nested
(reentrant) calls to them.
Note that because there is a single `nonReentrant` guard, functions marked as
`nonReentrant` may not call one another. This can be worked around by making
those functions `private`, and then adding `external` `nonReentrant` entry
points to them.
TIP: If you would like to learn more about reentrancy and alternative ways
to protect against it, check out our blog post
https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After
Istanbul].*


## State Variables
### __locked

```solidity
uint256 private __locked;
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
### __ReentrancyGuard_init


```solidity
function __ReentrancyGuard_init() internal onlyInitializing;
```

### __ReentrancyGuard_init_unchained


```solidity
function __ReentrancyGuard_init_unchained() internal onlyInitializing;
```

### nonReentrant

*Prevents a contract from calling itself, directly or indirectly.
Calling a `nonReentrant` function from another `nonReentrant`
function is not supported. It is possible to prevent this from happening
by making the `nonReentrant` function external, and making it call a
`private` function that does the actual work.*


```solidity
modifier nonReentrant();
```

### __nonReentrantBefore


```solidity
function __nonReentrantBefore() private;
```

### __nonReentrantAfter


```solidity
function __nonReentrantAfter() private;
```

