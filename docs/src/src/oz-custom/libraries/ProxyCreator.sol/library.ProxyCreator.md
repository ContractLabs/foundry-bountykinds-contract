# ProxyCreator
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/ProxyCreator.sol)


## State Variables
### PROXY_BYTECODE

```solidity
bytes internal constant PROXY_BYTECODE =
    hex"630000000980600E6000396000F3363d8037363d34f0ff";
```


### PROXY_BYTECODE_HASH
*value is equal to keccak256(PROXY_BYTECODE)*


```solidity
bytes32 internal constant PROXY_BYTECODE_HASH =
    0x68afe50fe78ae96feb6ec11f21f31fdd467c9fcc7add426282cfa3913daf04e9;
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
function getDeployed(bytes32 salt) internal view returns (address);
```

