# ProxylessUpgrader
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal-upgradeable/ProxylessUpgrader.sol)

**Inherits:**
[ContextUpgradeable](/src/oz-custom/oz-upgradeable/utils/ContextUpgradeable.sol/abstract.ContextUpgradeable.md), [DeterministicDeployer](/src/oz-custom/internal/DeterministicDeployer.sol/abstract.DeterministicDeployer.md)


## State Variables
### instance

```solidity
IKillable public instance;
```


### __gap

```solidity
uint256[49] private __gap;
```


## Functions
### _destroy


```solidity
function _destroy() internal;
```

### _deploy


```solidity
function _deploy(
    uint256 amount_,
    bytes32 salt_,
    bytes memory bytecode_
)
    internal
    override
    returns (address _instance);
```

