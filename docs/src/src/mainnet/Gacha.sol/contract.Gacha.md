# Gacha
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/Gacha.sol)

**Inherits:**
[IGacha](/src/interfaces/IGacha.sol/interface.IGacha.md), [ManagerUpgradeable](/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol/abstract.ManagerUpgradeable.md), [SignableUpgradeable](/src/oz-custom/internal-upgradeable/SignableUpgradeable.sol/abstract.SignableUpgradeable.md), [TransferableUpgradeable](/src/oz-custom/internal-upgradeable/TransferableUpgradeable.sol/abstract.TransferableUpgradeable.md), [BKFundForwarderUpgradeable](/src/internal-upgradeable/BKFundForwarderUpgradeable.sol/abstract.BKFundForwarderUpgradeable.md)


## State Variables
### __CLAIM_TYPE_HASH
*value is equal to keccak256("Claim(address token,uint256
ticketId,uint256 value,uint256 deadline,uint256
nonce)")*


```solidity
bytes32 private constant __CLAIM_TYPE_HASH =
    0xff5122c8134d613571bf8ae24cff90116c8242a568b8dbe337419081fa1403bb;
```


### __tickets

```solidity
mapping(uint256 => Ticket) private __tickets;
```


### __supportedPayments

```solidity
BitMapsUpgradeable.BitMap private __supportedPayments;
```


### __unitPrices

```solidity
mapping(uint256 => mapping(address => uint96)) private __unitPrices;
```


### __gap

```solidity
uint256[47] private __gap;
```


## Functions
### initialize


```solidity
function initialize(IAuthority authority_) external initializer;
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


### updateTicketPrice

*Updates the prices for a specific ticket type.*


```solidity
function updateTicketPrice(
    uint256 typeId_,
    address[] calldata supportedPayments_,
    uint96[] calldata unitPrices_
)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`typeId_`|`uint256`|The identifier for the ticket type.|
|`supportedPayments_`|`address[]`|The array of supported payment tokens.|
|`unitPrices_`|`uint96[]`|The array of unit prices corresponding to supported payment tokens.|


### supportedPayments

*Checks if a payment token is supported.*


```solidity
function supportedPayments(address payment_) external view returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`payment_`|`address`|The payment token address to check.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|Whether the payment token is supported.|


### redeemTicket

*Redeems a ticket for a user, verifying payment and updating ticket
status.*


```solidity
function redeemTicket(
    address user_,
    address token_,
    uint256 value_,
    uint256 id_,
    uint256 type_
)
    external
    onlyRole(Roles.PROXY_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user redeeming the ticket.|
|`token_`|`address`|The payment token address.|
|`value_`|`uint256`|The payment value.|
|`id_`|`uint256`|The ID of the ticket.|
|`type_`|`uint256`|The type of the ticket.|


### claimReward

*Claims the reward for a redeemed ticket, validating the signature
and updating ticket status.*


```solidity
function claimReward(
    address token_,
    uint256 ticketId_,
    uint256 value_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    whenNotPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token_`|`address`|The reward token address.|
|`ticketId_`|`uint256`|The ID of the redeemed ticket.|
|`value_`|`uint256`|The reward value.|
|`deadline_`|`uint256`|The deadline for the signature.|
|`signature_`|`bytes`|The signature for the claim.|


### nonces

*Retrieves the nonce for a specific ticket ID.*


```solidity
function nonces(uint256 ticketId_) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`ticketId_`|`uint256`|The ID of the ticket.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The nonce for the given ticket ID.|


### _beforeRecover


```solidity
function _beforeRecover(bytes memory) internal override whenPaused;
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

