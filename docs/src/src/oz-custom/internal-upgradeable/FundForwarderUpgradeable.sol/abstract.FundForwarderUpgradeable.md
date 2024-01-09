# FundForwarderUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/FundForwarderUpgradeable.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ProxyCheckerUpgradeable](/src/oz-custom/internal-upgradeable/ProxyCheckerUpgradeable.sol/abstract.ProxyCheckerUpgradeable.md), [TransferableUpgradeable](/src/oz-custom/internal-upgradeable/TransferableUpgradeable.sol/abstract.TransferableUpgradeable.md), [IFundForwarderUpgradeable](/src/oz-custom/internal-upgradeable/interfaces/IFundForwarderUpgradeable.sol/interface.IFundForwarderUpgradeable.md)

*Abstract contract for forwarding funds to a specified address.*


## State Variables
### __vault
*Address to forward funds to*


```solidity
bytes32 private __vault;
```


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### receive

*Receives funds and forwards them to the vault address*


```solidity
receive() external payable virtual onlyEOA;
```

### __FundForwarder_init


```solidity
function __FundForwarder_init(address vault_)
    internal
    virtual
    onlyInitializing;
```

### __FundForwarder_init_unchained


```solidity
function __FundForwarder_init_unchained(address vault_)
    internal
    virtual
    onlyInitializing;
```

### recover


```solidity
function recover(RecoveryCallData[] calldata calldata_) external virtual;
```

### recoverNative

*Recovers native currency to the vault address*


```solidity
function recoverNative() external virtual;
```

### vault


```solidity
function vault() public view virtual returns (address vault_);
```

### _changeVault

*Changes the vault address*


```solidity
function _changeVault(address vault_) internal virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|New vault address|


### safeRecoverHeader

*value is equal to
keccak256("VaultUpdated(address,address,address)")*


```solidity
function safeRecoverHeader() public pure virtual returns (bytes memory);
```

### safeTransferHeader


```solidity
function safeTransferHeader() public pure virtual returns (bytes memory);
```

### _beforeRecover


```solidity
function _beforeRecover(bytes memory data_) internal virtual;
```

### _afterRecover


```solidity
function _afterRecover(
    address vault_,
    address token_,
    uint256 value_,
    bytes memory params_
)
    internal
    virtual;
```

### _checkValidAddress

*Asserts that the given address is not the zero address*


```solidity
function _checkValidAddress(address addr_) internal view virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`addr_`|`address`|The address to check|


