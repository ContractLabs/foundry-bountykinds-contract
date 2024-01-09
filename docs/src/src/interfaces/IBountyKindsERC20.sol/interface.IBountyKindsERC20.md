# IBountyKindsERC20
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IBountyKindsERC20.sol)

*This interface defines the methods and events for a contract that
manages a ERC20 token and allows executing
calls to external contracts.*


## Functions
### setPool

*Sets the Uniswap V2 pair address.*


```solidity
function setPool(IUniswapV2Pair pool_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`pool_`|`IUniswapV2Pair`|The address of the new Uniswap V2 pair.|


### mint

*Mints tokens to the specified address.*


```solidity
function mint(address to_, uint256 amount_) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address that will receive the tokens.|
|`amount_`|`uint256`|The amount of tokens to mint.|


### execute

*Executes a call to an external contract.*


```solidity
function execute(
    address target_,
    uint256 value_,
    bytes calldata calldata_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`target_`|`address`|The address of the external contract to call.|
|`value_`|`uint256`|The amount of ether to send with the call.|
|`calldata_`|`bytes`|The data to send with the call.|


## Events
### Refunded
*Emitted when a refund is made to an operator.*


```solidity
event Refunded(address indexed operator, uint256 indexed refund);
```

### Executed
*Emitted when a call to an external contract is executed.*


```solidity
event Executed(
    address indexed operator,
    address indexed target,
    uint256 indexed value_,
    bytes callData,
    bytes returnData
);
```

### PoolSet
*Emitted when the Uniswap V2 pair is updated.*


```solidity
event PoolSet(
    address indexed operator,
    IUniswapV2Pair indexed poolOld,
    IUniswapV2Pair indexed poolNew
);
```

## Errors
### BountyKindsERC20__Blacklisted

```solidity
error BountyKindsERC20__Blacklisted();
```

### BountyKindsERC20__InvalidArguments

```solidity
error BountyKindsERC20__InvalidArguments();
```

