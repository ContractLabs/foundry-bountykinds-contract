# MulticallUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets-upgradeable/MulticallUpgradeable.sol)

**Inherits:**
[IMulticall](/src/oz-custom/presets/interfaces/IMulticall.sol/interface.IMulticall.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ReentrancyGuardUpgradeable](/src/oz-custom/oz-upgradeable/security/ReentrancyGuardUpgradeable.sol/abstract.ReentrancyGuardUpgradeable.md)


## State Variables
### __original
*Address of the original contract*


```solidity
address private __original;
```


## Functions
### nonDelegatecall


```solidity
modifier nonDelegatecall() virtual;
```

### __Multicall_init


```solidity
function __Multicall_init() internal onlyInitializing;
```

### __Multicall_init_unchained


```solidity
function __Multicall_init_unchained() internal onlyInitializing;
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
    nonReentrant
    returns (bytes[] memory results);
```

### __nonDelegatecall


```solidity
function __nonDelegatecall() private view;
```

