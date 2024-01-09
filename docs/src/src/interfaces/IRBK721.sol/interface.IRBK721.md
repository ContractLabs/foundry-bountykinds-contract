# IRBK721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/interfaces/IRBK721.sol)

**Inherits:**
[IBK721](/src/interfaces/IBK721.sol/interface.IBK721.md)

*Interface for the RBK721 contract, extending IBK721 and adding
RBK721-specific functionalities.*


## Functions
### setUser

*Allows a user to rent an RBK721 token by setting user-specific
information.*


```solidity
function setUser(
    address user_,
    uint256 tokenId,
    uint64 expires_,
    uint256 deadline_,
    bytes calldata signature_
)
    external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user_`|`address`|The address of the user renting the RBK721 token.|
|`tokenId`|`uint256`|The ID of the RBK721 token to be rented.|
|`expires_`|`uint64`|The timestamp indicating the expiration of the user's rental period.|
|`deadline_`|`uint256`|The deadline by which the transaction must be executed.|
|`signature_`|`bytes`|The signature for authentication.|


## Errors
### RBK721__Rented

```solidity
error RBK721__Rented();
```

### RBK721__Expired

```solidity
error RBK721__Expired();
```

### RBK721__InvalidSignature

```solidity
error RBK721__InvalidSignature();
```

