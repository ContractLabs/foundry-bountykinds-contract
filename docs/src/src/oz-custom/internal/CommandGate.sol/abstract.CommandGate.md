# CommandGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/CommandGate.sol)

**Inherits:**
[ICommandGate](/src/oz-custom/internal/interfaces/ICommandGate.sol/interface.ICommandGate.md), [FundForwarder](/src/oz-custom/internal/FundForwarder.sol/abstract.FundForwarder.md)


## State Variables
### __isWhitelisted

```solidity
BitMaps.BitMap private __isWhitelisted;
```


### __whitelistedVaults

```solidity
BitMaps.BitMap private __whitelistedVaults;
```


## Functions
### constructor


```solidity
constructor(address[] memory vaults_) payable;
```

### depositWithCommand


```solidity
function depositWithCommand(
    Asset calldata asset_,
    Command calldata command_
)
    external
    payable
    virtual;
```

### isVaultWhitelisted


```solidity
function isVaultWhitelisted(address addr_)
    external
    view
    virtual
    returns (bool);
```

### isTargetWhitelisted


```solidity
function isTargetWhitelisted(address addr_)
    external
    view
    virtual
    returns (bool);
```

### _handleDeposit


```solidity
function _handleDeposit(
    address operator_,
    address mainVault_,
    Asset calldata asset_,
    Command calldata command_
)
    internal
    virtual;
```

### _beforeDeposit


```solidity
function _beforeDeposit(
    bool eoaCheck_,
    address operator_,
    address mainVault_,
    Asset memory asset_,
    Command memory command_,
    bytes memory extraData_
)
    internal
    virtual;
```

### _afterDeposit


```solidity
function _afterDeposit(
    address operator_,
    Asset memory asset_,
    Command memory command_,
    bytes memory
)
    internal
    virtual;
```

### _checkSender


```solidity
function _checkSender(
    bool eoaCheck_,
    address account_,
    Asset memory asset_,
    bytes memory
)
    internal
    view
    virtual;
```

### _checkCommand


```solidity
function _checkCommand(
    address mainVault_,
    Command memory command_,
    bytes memory
)
    internal
    view
    virtual;
```

### _executeCommand


```solidity
function _executeCommand(
    address target_,
    bytes4 fnSignature_,
    bytes memory params_
)
    internal
    virtual;
```

### _concatDepositData


```solidity
function _concatDepositData(
    address account_,
    address token_,
    uint256 value_,
    bytes memory extraData_,
    bytes memory data_
)
    internal
    pure
    virtual
    returns (bytes memory);
```

### _whitelistTarget


```solidity
function _whitelistTarget(address target_) internal virtual;
```

### _whitelistVaults


```solidity
function _whitelistVaults(address[] memory vaults_) internal virtual;
```

