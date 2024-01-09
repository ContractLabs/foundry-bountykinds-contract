# ICommandGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/ICommandGate.sol)


## Functions
### whitelistTarget


```solidity
function whitelistTarget(address addr_) external;
```

### whitelistVaults


```solidity
function whitelistVaults(address[] calldata vaults_) external;
```

### isVaultWhitelisted


```solidity
function isVaultWhitelisted(address addr_) external view returns (bool);
```

### isTargetWhitelisted


```solidity
function isTargetWhitelisted(address addr_) external view returns (bool);
```

## Events
### Whitelisted

```solidity
event Whitelisted(address indexed operator, address indexed addr);
```

### VaultsWhitelisted

```solidity
event VaultsWhitelisted(address indexed operator, address[] vaults);
```

### Commanded

```solidity
event Commanded(address indexed operator, Asset depositAsset, Command command);
```

## Errors
### CommandGate__UnknownAddress

```solidity
error CommandGate__UnknownAddress();
```

### CommandGate__InvalidArgument

```solidity
error CommandGate__InvalidArgument();
```

## Structs
### Asset

```solidity
struct Asset {
    address token;
    uint256 value;
    address account;
    uint256 deadline;
    bytes signature;
    bytes extraData;
}
```

### Command

```solidity
struct Command {
    bytes4 fnSig;
    address target;
    address vault;
    bytes arguments;
}
```

