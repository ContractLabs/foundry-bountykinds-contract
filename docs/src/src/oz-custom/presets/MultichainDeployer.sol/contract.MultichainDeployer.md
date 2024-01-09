# MultichainDeployer
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/MultichainDeployer.sol)

**Inherits:**
[Create2Deployer](/src/oz-custom/internal/DeterministicDeployer.sol/abstract.Create2Deployer.md), [ReentrancyGuard](/src/oz-custom/oz/security/ReentrancyGuard.sol/abstract.ReentrancyGuard.md), [IMultichainDeployer](/src/oz-custom/presets/interfaces/IMultichainDeployer.sol/interface.IMultichainDeployer.md)


## State Variables
### VERSION
*value is equal to keccak256("MultichainDeployer_v1")*


```solidity
bytes32 public constant VERSION =
    0x9eea8cb98c11fea36be219299200e6b67153ef85e64f26fbca079445a66e02d2;
```


## Functions
### constructor


```solidity
constructor() payable ReentrancyGuard;
```

### deploy


```solidity
function deploy(
    uint256 amount_,
    bytes32 salt_,
    bytes calldata bytecode_
)
    external
    payable
    nonReentrant
    returns (address);
```

### isDeployerOf


```solidity
function isDeployerOf(
    address instance_,
    bytes32 initCodehash_,
    bytes32 salt_
)
    external
    view
    returns (bool);
```

