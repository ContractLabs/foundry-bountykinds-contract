# IFactoryUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/interfaces/IFactoryUpgradeable.sol)


## Functions
### implement


```solidity
function implement(bytes4 interfaceId_) external view returns (address);
```

### deployed


```solidity
function deployed(address addr_) external view returns (bool);
```

### cloneOf


```solidity
function cloneOf(
    bytes4 interfaceId_,
    bytes32 salt_
)
    external
    view
    returns (address clone, bool isCloned);
```

### instanceOf


```solidity
function instanceOf(
    bytes32 bytecodeHash_,
    bytes32 salt_
)
    external
    view
    returns (address instance, bool isDeployed);
```

### instanceOf


```solidity
function instanceOf(bytes32 salt_)
    external
    view
    returns (address instance, bool isDeployed);
```

## Events
### Cloned

```solidity
event Cloned(
    address indexed implement, bytes32 indexed salt, address indexed clone
);
```

### Deployed

```solidity
event Deployed(
    address indexed deployed,
    bytes32 indexed salt,
    bytes32 indexed bytecodeHash,
    uint256 version
);
```

## Errors
### Factory__CloneFailed

```solidity
error Factory__CloneFailed();
```

### Factory__NonExistImplement

```solidity
error Factory__NonExistImplement();
```

