# IERC721PermitUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721PermitUpgradeable.sol)

**Inherits:**
[IERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/IERC721Upgradeable.sol/interface.IERC721Upgradeable.md)

Extension to ERC721 that includes a permit function for signature
based approvals


## Functions
### DOMAIN_SEPARATOR

The domain separator used in the permit signature


```solidity
function DOMAIN_SEPARATOR() external view returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The domain seperator used in encoding of permit signature|


### permit

function to be called by anyone to approve `spender` using a
Permit signature

*Anyone can call this to approve `spender`, even a third-party*


```solidity
function permit(
    address spender,
    uint256 tokenId,
    uint256 deadline,
    bytes calldata signature
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`spender`|`address`|the actor to approve|
|`tokenId`|`uint256`|the token id|
|`deadline`|`uint256`|the deadline for the permit to be used|
|`signature`|`bytes`|permit|


### nonces


```solidity
function nonces(uint256 tokenId_) external view returns (uint256);
```

## Errors
### ERC721Permit__Expired

```solidity
error ERC721Permit__Expired();
```

### ERC721Permit__SelfApproving

```solidity
error ERC721Permit__SelfApproving();
```

