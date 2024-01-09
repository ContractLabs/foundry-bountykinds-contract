# BKFundForwarderUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/internal-upgradeable/BKFundForwarderUpgradeable.sol)

**Inherits:**
[FundForwarderUpgradeable](/src/oz-custom/internal-upgradeable/FundForwarderUpgradeable.sol/abstract.FundForwarderUpgradeable.md)

*Abstract contract extending FundForwarderUpgradeable with additional
features for BK-specific functionalities.*


## Functions
### safeRecoverHeader

*Retrieves the header for safeRecover functionality.*


```solidity
function safeRecoverHeader() public pure override returns (bytes memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The header as bytes.|


### safeTransferHeader

*value is equal keccak256("SAFE_RECOVER_HEADER")*

*Retrieves the header for safeTransfer functionality.*


```solidity
function safeTransferHeader() public pure override returns (bytes memory);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes`|The header as bytes.|


### _checkValidAddress

*value is equal keccak256("SAFE_TRANSFER")*

*Checks if the provided vault address is a valid Treasury contract.*


```solidity
function _checkValidAddress(address vault_) internal view virtual override;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`vault_`|`address`|The address of the vault.|


