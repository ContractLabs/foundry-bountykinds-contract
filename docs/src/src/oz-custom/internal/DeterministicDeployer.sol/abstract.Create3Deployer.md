# Create3Deployer
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/DeterministicDeployer.sol)

**Inherits:**
[DeterministicDeployer](/src/oz-custom/internal/DeterministicDeployer.sol/abstract.DeterministicDeployer.md)


## Functions
### instanceOf


```solidity
function instanceOf(bytes32 salt_)
    external
    view
    virtual
    returns (address instance, bool isDeployed);
```

### _deploy


```solidity
function _deploy(
    uint256 amount_,
    bytes32 salt_,
    bytes memory bytecode_
)
    internal
    virtual
    override
    returns (address instance);
```

