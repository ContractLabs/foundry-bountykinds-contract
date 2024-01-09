# ProxyCheckerUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/ProxyCheckerUpgradeable.sol)

*Abstract contract for checking if a call was made by a proxy contract or
an externally owned account.*


## State Variables
### _gap

```solidity
uint256[50] private _gap;
```


## Functions
### onlyEOA


```solidity
modifier onlyEOA();
```

### _onlyEOA


```solidity
function _onlyEOA(address sender_) internal view;
```

### _onlyEOA


```solidity
function _onlyEOA(address msgSender_, address txOrigin_) internal pure;
```

### _onlyProxy


```solidity
function _onlyProxy(address sender_) internal view;
```

### _onlyProxy


```solidity
function _onlyProxy(address msgSender_, address txOrigin_) internal view;
```

### _isProxyCall


```solidity
function _isProxyCall(
    address msgSender_,
    address txOrigin_
)
    internal
    pure
    returns (bool);
```

### _isProxy


```solidity
function _isProxy(address caller_) internal view returns (bool);
```

### _txOrigin


```solidity
function _txOrigin() internal view returns (address);
```

