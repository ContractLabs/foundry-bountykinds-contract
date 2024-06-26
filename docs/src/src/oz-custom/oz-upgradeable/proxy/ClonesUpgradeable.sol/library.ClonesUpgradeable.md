# ClonesUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/proxy/ClonesUpgradeable.sol)

*https://eips.ethereum.org/EIPS/eip-1167[EIP 1167] is a standard for
deploying minimal proxy contracts, also known as "clones".
> To simply and cheaply clone contract functionality in an immutable way,
this standard specifies
> a minimal bytecode implementation that delegates all calls to a known,
fixed address.
The library includes functions to deploy a proxy using either `create`
(traditional deployment) or `create2`
(salted deterministic deployment). It also includes functions to predict the
addresses of clones deployed using the
deterministic method.
_Available since v3.4._*


## Functions
### clone

*Deploys and returns the address of a clone that mimics the behaviour
of `implementation`.
This function uses the create opcode, which should never revert.*


```solidity
function clone(address implementation) internal returns (address instance);
```

### cloneDeterministic

*Deploys and returns the address of a clone that mimics the behaviour
of `implementation`.
This function uses the create2 opcode and a `salt` to deterministically
deploy
the clone. Using the same `implementation` and `salt` multiple time will
revert, since
the clones cannot be deployed twice at the same address.*


```solidity
function cloneDeterministic(
    address implementation,
    bytes32 salt
)
    internal
    returns (address instance);
```

### predictDeterministicAddress

*Computes the address of a clone deployed using
{Clones-cloneDeterministic}.*


```solidity
function predictDeterministicAddress(
    address implementation,
    bytes32 salt,
    address deployer
)
    internal
    pure
    returns (address predicted);
```

### predictDeterministicAddress

*Computes the address of a clone deployed using
{Clones-cloneDeterministic}.*


```solidity
function predictDeterministicAddress(
    address implementation,
    bytes32 salt
)
    internal
    view
    returns (address predicted);
```

