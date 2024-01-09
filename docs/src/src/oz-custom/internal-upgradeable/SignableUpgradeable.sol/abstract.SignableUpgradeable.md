# SignableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/SignableUpgradeable.sol)

**Inherits:**
[EIP712Upgradeable](/src/oz-custom/oz-upgradeable/utils/cryptography/EIP712Upgradeable.sol/abstract.EIP712Upgradeable.md), [ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [ISignableUpgradeable](/src/oz-custom/internal-upgradeable/interfaces/ISignableUpgradeable.sol/interface.ISignableUpgradeable.md)

*Abstract contract for signing and verifying typed data.*


## State Variables
### _nonces
*Mapping of nonces for each id*


```solidity
mapping(bytes32 => uint256) internal _nonces;
```


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### __Signable_init

*Constructor that initializes EIP712 with the given name and version*


```solidity
function __Signable_init(
    string calldata name_,
    string calldata version_
)
    internal
    onlyInitializing;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`name_`|`string`|Name of the typed data|
|`version_`|`string`|Version of the typed data|


### __Signable_init_unchained


```solidity
function __Signable_init_unchained(
    string memory name_,
    string memory version_
)
    internal
    onlyInitializing;
```

### _verify

*Verifies that the signer of the typed data is the given address*


```solidity
function _verify(
    address verifier_,
    bytes32 structHash_,
    bytes calldata signature_
)
    internal
    view
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verifier_`|`address`|Address to verify|
|`structHash_`|`bytes32`|Hash of the typed data|
|`signature_`|`bytes`|Signature of the typed data|


### _verify

*Verifies that the signer of the typed data is the given address*


```solidity
function _verify(
    address verifier_,
    bytes32 structHash_,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    internal
    view
    virtual;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`verifier_`|`address`|Address to verify|
|`structHash_`|`bytes32`|Hash of the typed data|
|`v`|`uint8`|ECDSA recovery value|
|`r`|`bytes32`|ECDSA r value|
|`s`|`bytes32`|ECDSA s value|


### _recoverSigner

*Recovers the signer of the typed data from the signature*


```solidity
function _recoverSigner(
    bytes32 structHash_,
    bytes calldata signature_
)
    internal
    view
    returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`structHash_`|`bytes32`|Hash of the typed data|
|`signature_`|`bytes`|Signature of the typed data|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|Address of the signer|


### _recoverSigner

*Recovers the signer of the typed data from the signature*


```solidity
function _recoverSigner(
    bytes32 structHash_,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    internal
    view
    returns (address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`structHash_`|`bytes32`|Hash of the typed data|
|`v`|`uint8`|ECDSA recovery value|
|`r`|`bytes32`|ECDSA r value|
|`s`|`bytes32`|ECDSA s value|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|Address of the signer|


### _useNonce

*Increases the nonce for the given account by 1*


```solidity
function _useNonce(bytes32 id_) internal virtual returns (uint256 nonce);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`id_`|`bytes32`|ID to increase the nonce for|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`nonce`|`uint256`|The new nonce for the account|


### DOMAIN_SEPARATOR

*value is equal to
keccak256("NonceIncremented(address,bytes32,uint256)")*


```solidity
function DOMAIN_SEPARATOR() external view virtual returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|Domain separator for EIP712 v4|


