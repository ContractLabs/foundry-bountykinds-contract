# IFundForwarderUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/interfaces/IFundForwarderUpgradeable.sol)


## Functions
### safeRecoverHeader


```solidity
function safeRecoverHeader() external pure returns (bytes memory);
```

### safeTransferHeader


```solidity
function safeTransferHeader() external pure returns (bytes memory);
```

### vault


```solidity
function vault() external view returns (address);
```

### changeVault


```solidity
function changeVault(address vault_) external;
```

### recoverNative

*Recovers native currency to the vault address*


```solidity
function recoverNative() external;
```

### recover


```solidity
function recover(RecoveryCallData[] calldata calldata_) external;
```

## Events
### VaultUpdated
*Emits when the vault address is updated*


```solidity
event VaultUpdated(
    address indexed operator, address indexed from, address indexed to
);
```

### Recovered
*Emits when a single ERC721 token is recovered*


```solidity
event Recovered(
    address indexed operator,
    address indexed token,
    uint256 indexed value,
    bytes params
);
```

### Forwarded
*Emits when funds are forwarded*


```solidity
event Forwarded(address indexed from, uint256 indexed amount);
```

## Errors
### FundForwarder__InvalidArgument

```solidity
error FundForwarder__InvalidArgument();
```

## Structs
### RecoveryCallData

```solidity
struct RecoveryCallData {
    address token;
    uint256 value;
    bytes4 fnSelector;
    bytes params;
}
```

