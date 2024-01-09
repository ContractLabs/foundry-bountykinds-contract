# IMulticall
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/interfaces/IMulticall.sol)


## Functions
### multicall


```solidity
function multicall(
    CallData[] calldata calldata_,
    bytes calldata data_
)
    external
    payable
    returns (bytes[] memory results);
```

## Events
### BatchExecuted

```solidity
event BatchExecuted(
    address indexed account,
    uint256 indexed value,
    CallData[] callData,
    bytes[] results
);
```

## Errors
### Multicall__DelegatecallNotAllowed

```solidity
error Multicall__DelegatecallNotAllowed();
```

## Structs
### CallData

```solidity
struct CallData {
    address target;
    uint256 value;
    bytes data;
}
```

