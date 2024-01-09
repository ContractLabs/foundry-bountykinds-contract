# MultiDelegatecall
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/MultiDelegatecall.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [ReentrancyGuard](/src/oz-custom/oz/security/ReentrancyGuard.sol/abstract.ReentrancyGuard.md)

*Abstract contract for performing multiple delegatecalls in a single
transaction.*


## State Variables
### __original
*Address of the original contract*


```solidity
address private immutable __original;
```


## Functions
### onlyDelegatecalll


```solidity
modifier onlyDelegatecalll() virtual;
```

### constructor

*Constructor that saves the address of the original contract*


```solidity
constructor() payable ReentrancyGuard;
```

### _multiDelegatecall

*Executes multiple delegatecalls in a single transaction*


```solidity
function _multiDelegatecall(bytes[] calldata data_)
    internal
    virtual
    onlyDelegatecalll
    nonReentrant
    returns (bytes[] memory results);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`data_`|`bytes[]`|Array of calldata for delegatecalls|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`results`|`bytes[]`|Array of delegatecall results|


### __onlyDelegateCall


```solidity
function __onlyDelegateCall() private view;
```

## Events
### BatchExecutionDelegated

```solidity
event BatchExecutionDelegated(
    address indexed operator, bytes[] callData, bytes[] results
);
```

