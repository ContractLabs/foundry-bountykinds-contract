# MerkleProofUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/utils/cryptography/MerkleProofUpgradeable.sol)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/utils/MerkleProofLib.sol), Modified from Solady
(https://github.com/Vectorized/solady/blob/main/src/utils/MerkleProofLib.sol)

Gas optimized merkle proof verification library.


## Functions
### verify


```solidity
function verify(
    bytes32[] calldata proof,
    bytes32 root,
    bytes32 leaf
)
    internal
    pure
    returns (bool isValid);
```

