# ERC1155TokenReceiver
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC1155/ERC1155.sol)

**Author:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC1155.sol)

A generic interface for a contract which properly accepts ERC1155
tokens.


## Functions
### onERC1155Received


```solidity
function onERC1155Received(
    address,
    address,
    uint256,
    uint256,
    bytes calldata
)
    external
    virtual
    returns (bytes4);
```

### onERC1155BatchReceived


```solidity
function onERC1155BatchReceived(
    address,
    address,
    uint256[] calldata,
    uint256[] calldata,
    bytes calldata
)
    external
    virtual
    returns (bytes4);
```

