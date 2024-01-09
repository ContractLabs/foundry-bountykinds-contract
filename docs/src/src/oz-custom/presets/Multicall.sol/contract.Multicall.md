# Multicall
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/Multicall.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [IMulticall](/src/oz-custom/presets/interfaces/IMulticall.sol/interface.IMulticall.md), [ReentrancyGuard](/src/oz-custom/oz/security/ReentrancyGuard.sol/abstract.ReentrancyGuard.md)


## State Variables
### __original
*Address of the original contract*


```solidity
address private immutable __original;
```


## Functions
### nonDelegatecall


```solidity
modifier nonDelegatecall() virtual;
```

### constructor

*Constructor that saves the address of the original contract*


```solidity
constructor() payable ReentrancyGuard;
```

### multicall


```solidity
function multicall(
    CallData[] calldata calldata_,
    bytes calldata data_
)
    external
    payable
    virtual
    returns (bytes[] memory results);
```

### _multicall


```solidity
function _multicall(
    CallData[] calldata calldata_,
    bytes calldata
)
    internal
    virtual
    nonDelegatecall
    nonReentrant
    returns (bytes[] memory results);
```

### __nonDelegatecall


```solidity
function __nonDelegatecall() private view;
```

