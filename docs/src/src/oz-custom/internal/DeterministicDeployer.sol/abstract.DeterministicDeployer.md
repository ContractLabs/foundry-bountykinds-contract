# DeterministicDeployer
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/DeterministicDeployer.sol)


## Functions
### _deploy


```solidity
function _deploy(
    uint256 amount_,
    bytes32 salt_,
    bytes memory bytecode_
)
    internal
    virtual
    returns (address instance);
```

## Events
### Deployed

```solidity
event Deployed(
    address indexed deployer,
    address indexed instance,
    bytes32 indexed salt,
    bytes32 bytecodeHash,
    string factory
);
```

