# INO
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/INO.sol)

**Inherits:**
[IINO](/src/interfaces/IINO.sol/interface.IINO.md), [ManagerUpgradeable](/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol/abstract.ManagerUpgradeable.md), [BKFundForwarderUpgradeable](/src/internal-upgradeable/BKFundForwarderUpgradeable.sol/abstract.BKFundForwarderUpgradeable.md)


## State Variables
### VERSION

```solidity
bytes32 public constant VERSION =
    0x3d277aecc6eab90208a3b105ab5e72d55c1c0c69bf67ccc488f44498aef41550;
```


### __PERMIT_TYPE_HASH
*value is equal to keccak256("Permit(address buyer,uint256
ticketId,uint256 amount,uint256 nonce,uint256
deadline)")*


```solidity
bytes32 public constant __PERMIT_TYPE_HASH =
    0x5421fbeb44dd87c0132aceddf0c5325a43ac9ccb2291ee8cbf59d92a5fb63681;
```


### __supplies

```solidity
mapping(uint256 => uint256) private __supplies;
```


### __campaigns

```solidity
mapping(uint256 => bytes32) private __campaigns;
```


### __purchasedAmt

```solidity
mapping(bytes32 => mapping(uint256 => uint256)) private __purchasedAmt;
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


### ticketId

*Calculates the ID of a ticket for a specific campaign and amount.*


```solidity
function ticketId(
    uint64 campaignId_,
    uint32 amount_
)
    external
    pure
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint64`|The ID of the campaign.|
|`amount_`|`uint32`|The amount of NFTs in the ticket.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The calculated ticket ID.|


### redeem

*Redeems an INO ticket for a specific user.*


```solidity
function redeem(
    address user_,
    address token_,
    uint256 value_,
    uint256 ticketId_
)
    external
    onlyRole(Roles.PROXY_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user redeeming the ticket.|
|`token_`|`address`|The payment token used for redemption.|
|`value_`|`uint256`|The value of the payment token.|
|`ticketId_`|`uint256`|The ID of the INO ticket.|


### setCampaign

*Sets the details of a specific INO campaign.*


```solidity
function setCampaign(
    uint256 campaignId_,
    Campaign calldata campaign_
)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|
|`campaign_`|`Campaign`|The details of the campaign.|


### paymentOf

*Retrieves the supported payment tokens for a specific campaign.*


```solidity
function paymentOf(uint256 campaignId_)
    public
    view
    returns (address[] memory);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address[]`|An array of supported payment tokens.|


### campaign

*Retrieves the details of a specific INO campaign.*


```solidity
function campaign(uint256 campaignId_)
    external
    view
    returns (Campaign memory campaign_);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`campaignId_`|`uint256`|The ID of the campaign.|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`campaign_`|`Campaign`|The details of the campaign.|


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

