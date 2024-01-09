# ERC721TokenReceiver
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/ERC721.sol)

**Author:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC721.sol)

A generic interface for a contract which properly accepts ERC721
tokens.


## Functions
### onERC721Received


```solidity
function onERC721Received(
    address,
    address,
    uint256,
    bytes calldata
)
    external
    virtual
    returns (bytes4);
```

