# IOwnable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/access/Ownable.sol)


## Functions
### renounceOwnership


```solidity
function renounceOwnership() external;
```

### transferOwnership


```solidity
function transferOwnership(address newOwner) external;
```

### owner


```solidity
function owner() external view returns (address _owner);
```

## Events
### OwnershipTransferred

```solidity
event OwnershipTransferred(
    address indexed previousOwner, address indexed newOwner
);
```

## Errors
### Ownable__Unauthorized

```solidity
error Ownable__Unauthorized();
```

### Ownable__NonZeroAddress

```solidity
error Ownable__NonZeroAddress();
```

