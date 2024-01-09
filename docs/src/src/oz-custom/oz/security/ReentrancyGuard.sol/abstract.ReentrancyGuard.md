# ReentrancyGuard
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/security/ReentrancyGuard.sol)


## State Variables
### __locked

```solidity
uint256 private __locked;
```


## Functions
### nonReentrant


```solidity
modifier nonReentrant();
```

### constructor


```solidity
constructor() payable;
```

### __nonReentrantBefore


```solidity
function __nonReentrantBefore() private;
```

### __nonReentrantAfter


```solidity
function __nonReentrantAfter() private;
```

