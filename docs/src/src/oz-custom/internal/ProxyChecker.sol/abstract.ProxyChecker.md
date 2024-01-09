# ProxyChecker
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/ProxyChecker.sol)

*Abstract contract for checking if a call was made by a proxy contract or
an externally owned account.*


## Functions
### onlyProxy


```solidity
modifier onlyProxy();
```

### onlyEOA

*Modifier to allow a function to be called only by an externally
owned account*


```solidity
modifier onlyEOA();
```

### _onlyEOA

*Check if the sender is an externally owned account*


```solidity
function _onlyEOA(address sender_) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sender_`|`address`|Address of the sender|


### _onlyEOA

*Check if the sender is an externally owned account*


```solidity
function _onlyEOA(address msgSender_, address txOrigin_) internal pure;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`msgSender_`|`address`|Address of the sender|
|`txOrigin_`|`address`|Origin of the transaction|


### _onlyProxy

*Check if the sender is a proxy contract*


```solidity
function _onlyProxy(address sender_) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sender_`|`address`|Address of the sender|


### _onlyProxy

*Check if the sender is a proxy contract*


```solidity
function _onlyProxy(address msgSender_, address txOrigin_) internal view;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`msgSender_`|`address`|Address of the sender|
|`txOrigin_`|`address`|Origin of the transaction|


### _isProxyCall

*Check if the call was made by a proxy contract*


```solidity
function _isProxyCall(
    address msgSender_,
    address txOrigin_
)
    internal
    pure
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`msgSender_`|`address`|Address of the sender|
|`txOrigin_`|`address`|Origin of the transaction|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the call was made by a proxy contract, false otherwise|


### _isProxy

*Check if the caller is a proxy contract*


```solidity
function _isProxy(address caller_) internal view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`caller_`|`address`|Address of the caller|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|True if the caller is a proxy contract, false otherwise|


### _txOrigin

*Returns the origin of the transaction*


```solidity
function _txOrigin() internal view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|Origin of the transaction|


