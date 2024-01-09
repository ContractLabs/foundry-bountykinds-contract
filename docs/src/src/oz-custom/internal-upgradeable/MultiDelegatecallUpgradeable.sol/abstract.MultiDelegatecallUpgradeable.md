# MultiDelegatecallUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/MultiDelegatecallUpgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ReentrancyGuardUpgradeable](/src/oz-custom/oz-upgradeable/security/ReentrancyGuardUpgradeable.sol/abstract.ReentrancyGuardUpgradeable.md)

*Abstract contract for performing multiple delegatecalls in a single
transaction.*


## State Variables
### __original
*Address of the original contract*


```solidity
bytes32 private __original;
```


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### onlyDelegatecalll


```solidity
modifier onlyDelegatecalll();
```

### __MultiDelegatecall_init


```solidity
function __MultiDelegatecall_init() internal virtual onlyInitializing;
```

### __MultiDelegatecall_init_unchained


```solidity
function __MultiDelegatecall_init_unchained()
    internal
    virtual
    onlyInitializing;
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
function __onlyDelegateCall(bytes32 originalBytes_) private view;
```

## Events
### BatchExecutionDelegated

```solidity
event BatchExecutionDelegated(
    address indexed operator, bytes[] callData, bytes[] results
);
```

