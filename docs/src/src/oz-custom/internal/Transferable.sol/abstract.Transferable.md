# Transferable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/Transferable.sol)

*Library for transferring Ether and tokens between accounts*


## Functions
### _safeTransferFrom

*Reverts the transaction if the transfer fails*


```solidity
function _safeTransferFrom(
    address token_,
    address from_,
    address to_,
    uint256 value_,
    bytes memory data_
)
    internal
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|Address of the token contract to transfer. If zero address, transfer Ether.|
|`from_`|`address`|Address to transfer from|
|`to_`|`address`|Address to transfer to|
|`value_`|`uint256`|Amount of tokens or Ether to transfer|
|`data_`|`bytes`||


### _safeTransfer

*Reverts the transaction if the transfer fails*


```solidity
function _safeTransfer(
    address token_,
    address to_,
    uint256 value_,
    bytes memory data_
)
    internal
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|Address of the token contract to transfer. If zero address, transfer Ether.|
|`to_`|`address`|Address to transfer to|
|`value_`|`uint256`|Amount of tokens or Ether to transfer|
|`data_`|`bytes`||


### _safeNativeTransfer

*Reverts the transaction if the Ether transfer fails*


```solidity
function _safeNativeTransfer(
    address to_,
    uint256 amount_,
    bytes memory data_
)
    internal
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|Address to transfer to|
|`amount_`|`uint256`|Amount of Ether to transfer|
|`data_`|`bytes`||


### _safeERC20Transfer


```solidity
function _safeERC20Transfer(
    IERC20 token_,
    address to_,
    uint256 amount_
)
    internal
    virtual;
```

### _safeERC20TransferFrom


```solidity
function _safeERC20TransferFrom(
    IERC20 token_,
    address from_,
    address to_,
    uint256 amount_
)
    internal
    virtual;
```

### _nativeTransfer


```solidity
function _nativeTransfer(
    address to_,
    uint256 amount_,
    bytes memory data_
)
    internal
    virtual
    returns (bool success);
```

### _ERC20Transfer


```solidity
function _ERC20Transfer(
    IERC20 token_,
    address to_,
    uint256 value_
)
    internal
    virtual
    returns (bool success);
```

### _ERC20TransferFrom


```solidity
function _ERC20TransferFrom(
    IERC20 token_,
    address from_,
    address to_,
    uint256 value_
)
    internal
    virtual
    returns (bool success);
```

### __checkValidTransfer


```solidity
function __checkValidTransfer(address to_, uint256 value_) private pure;
```

