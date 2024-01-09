# ECDSA
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/cryptography/ECDSA.sol)

**Authors:**
Solmate
(https://github.com/Rari-Capital/solmate/blob/main/src/utils/ECDSA.sol), Modified from OpenZeppelin
(https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol)

Gas optimized ECDSA wrapper.


## Functions
### recover


```solidity
function recover(
    bytes32 hash,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    internal
    view
    returns (address result);
```

### recover


```solidity
function recover(
    bytes32 hash,
    bytes calldata signature
)
    internal
    view
    returns (address result);
```

### toTypedDataHash


```solidity
function toTypedDataHash(
    bytes32 domainSeparator,
    bytes32 structHash
)
    internal
    pure
    returns (bytes32 result);
```

### toEthSignedMessageHash


```solidity
function toEthSignedMessageHash(bytes32 hash)
    internal
    pure
    returns (bytes32 result);
```

### toEthSignedMessageHash


```solidity
function toEthSignedMessageHash(bytes memory s)
    internal
    pure
    returns (bytes32 result);
```

