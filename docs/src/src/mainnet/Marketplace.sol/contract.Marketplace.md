# Marketplace
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/Marketplace.sol)

**Inherits:**
[IMarketplace](/src/interfaces/IMarketplace.sol/interface.IMarketplace.md), [ManagerUpgradeable](/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol/abstract.ManagerUpgradeable.md), [SignableUpgradeable](/src/oz-custom/internal-upgradeable/SignableUpgradeable.sol/abstract.SignableUpgradeable.md), [BKFundForwarderUpgradeable](/src/internal-upgradeable/BKFundForwarderUpgradeable.sol/abstract.BKFundForwarderUpgradeable.md)


## State Variables
### PERCENTAGE_FRACTION

```solidity
uint256 public constant PERCENTAGE_FRACTION = 10_000;
```


### __PERMIT_TYPE_HASH
*value is equal to keccak256("Permit(address buyer,address
nft,address payment,uint256 price,uint256
tokenId,uint256 nonce,uint256 deadline)")*


```solidity
bytes32 private constant __PERMIT_TYPE_HASH =
    0xc396b6309f782cacc3389f4dd579db291ad1b771b8b4966f3695dab14150633e;
```


### protocolFee

```solidity
uint256 public protocolFee;
```


### __whitelistedContracts

```solidity
BitMapsUpgradeable.BitMap private __whitelistedContracts;
```


### __gap

```solidity
uint256[48] private __gap;
```


## Functions
### initialize


```solidity
function initialize(
    uint256 feeFraction_,
    IAuthority authority_,
    address[] calldata supportedContracts_
)
    external
    initializer;
```

### __Marketplace_init_unchained


```solidity
function __Marketplace_init_unchained(
    uint256 feeFraction_,
    address[] calldata supportedContracts_
)
    internal
    onlyInitializing;
```

### changeVault

*Allows only the treasurer to change the vault address.*


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.TREASURER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|The new vault address.|


### whiteListContracts


```solidity
function whiteListContracts(address[] calldata addrs_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### setProtocolFee

*Sets the protocol fee fraction for the marketplace.*


```solidity
function setProtocolFee(uint256 feeFraction_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`feeFraction_`|`uint256`|The fraction of the transaction amount to be charged as a protocol fee.|


### redeem

*Redeems an NFT from the marketplace.*


```solidity
function redeem(
    uint256 deadline_,
    Buyer calldata buyer_,
    Seller calldata sellItem_,
    bytes calldata signature_
)
    external
    payable
    whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`buyer_`|`Buyer`|The buyer's information for the transaction.|
|`sellItem_`|`Seller`||
|`signature_`|`bytes`|The signature for authentication.|


### nonces

*Retrieves the nonce associated with a specific account.*


```solidity
function nonces(address account_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`account_`|`address`|The address of the account.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The nonce value for the account.|


### isWhitelisted

*Checks if a contract address is whitelisted.*


```solidity
function isWhitelisted(address addr_) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`addr_`|`address`|The contract address to check.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|Whether the contract address is whitelisted.|


### _beforeRecover


```solidity
function _beforeRecover(bytes memory)
    internal
    override
    whenPaused
    onlyRole(Roles.OPERATOR_ROLE);
```

### _afterRecover


```solidity
function _afterRecover(
    address,
    address,
    uint256,
    bytes memory
)
    internal
    override;
```

### __setProtocolFee


```solidity
function __setProtocolFee(uint256 feeFraction_) private;
```

### __transferItem


```solidity
function __transferItem(
    address buyerAddr_,
    address sellerAddr_,
    Seller calldata seller_
)
    private;
```

### __processPayment


```solidity
function __processPayment(
    address buyerAddr_,
    address sellerAddr_,
    Buyer calldata buyer_,
    Seller calldata seller_
)
    private;
```

### __whiteListContracts


```solidity
function __whiteListContracts(address[] calldata supportedContracts_) private;
```

### __checkSignature


```solidity
function __checkSignature(
    address buyer,
    uint256 deadline_,
    Seller calldata sellItem,
    bytes calldata signature_
)
    private;
```

