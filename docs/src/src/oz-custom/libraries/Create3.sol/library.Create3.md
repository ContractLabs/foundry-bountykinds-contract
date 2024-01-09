# Create3
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/Create3.sol)

**Authors:**
Solmate
(https://github.com/transmissions11/solmate/blob/main/src/utils/CREATE3.sol), Modified from 0xSequence
(https://github.com/0xSequence/create3/blob/master/contracts/Create3.sol)

Deploy to deterministic addresses without an initcode factor.


## State Variables
### PROXY_BYTECODE

```solidity
uint256 internal constant PROXY_BYTECODE =
    0x67_36_3d_3d_37_36_3d_34_f0_3d_52_60_08_60_18_f3;
```


### PROXY_BYTECODE_HASH
*value is equal to keccak256(PROXY_BYTECODE)*


```solidity
bytes32 internal constant PROXY_BYTECODE_HASH =
    0x21c35dbe1b344a2488cf3321d6ce542f8e9f305544ff09e4993a62319a497c1f;
```


## Functions
### deploy


```solidity
function deploy(
    bytes32 salt,
    bytes memory creationCode,
    uint256 value
)
    internal
    returns (address deployed);
```

### getDeployed


```solidity
function getDeployed(bytes32 salt) internal view returns (address deployed);
```

## Errors
### Create3__DeploymentFailed

```solidity
error Create3__DeploymentFailed();
```

### Create3__InitializationFailed

```solidity
error Create3__InitializationFailed();
```

