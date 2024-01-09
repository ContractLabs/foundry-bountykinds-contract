# FactoryProofs
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/FactoryProof.sol)


## Functions
### verifyDeployedBy


```solidity
function verifyDeployedBy(
    address deployed,
    address deployer,
    uint32 deployNonce
)
    external
    pure
    returns (bool);
```

### verifySaltedDeployedBy


```solidity
function verifySaltedDeployedBy(
    address deployed,
    address deployer,
    bytes32 initCodeHash,
    bytes32 deploySalt
)
    external
    pure
    returns (bool);
```

