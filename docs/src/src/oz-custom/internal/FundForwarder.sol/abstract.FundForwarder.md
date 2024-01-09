# FundForwarder
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/FundForwarder.sol)

**Inherits:**
[Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [ProxyChecker](/src/oz-custom/internal/ProxyChecker.sol/abstract.ProxyChecker.md), [Transferable](/src/oz-custom/internal/Transferable.sol/abstract.Transferable.md), [IFundForwarder](/src/oz-custom/internal/interfaces/IFundForwarder.sol/interface.IFundForwarder.md)

*Abstract contract for forwarding funds to a specified address.*


## State Variables
### __vault
*Address to forward funds to*


```solidity
bytes32 private __vault;
```


## Functions
### receive

*Receives funds and forwards them to the vault address*


```solidity
receive() external payable virtual onlyEOA;
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

### safeRecoverHeader


```solidity
function safeRecoverHeader() public pure virtual returns (bytes memory);
```

### safeTransferHeader


```solidity
function safeTransferHeader() public pure virtual returns (bytes memory);
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


### _beforeRecover

*value is equal to
keccak256("VaultUpdated(address,address,address)")*


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


