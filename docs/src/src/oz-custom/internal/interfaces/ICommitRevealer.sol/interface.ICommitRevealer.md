# ICommitRevealer
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/interfaces/ICommitRevealer.sol)


## Functions
### commit


```solidity
function commit(address from_, bytes32 commitment_) external;
```

## Events
### Commited

```solidity
event Commited(
    address indexed submitter,
    bytes32 indexed commiment,
    uint256 indexed timePoint,
    bytes extraData
);
```

## Errors
### CommitRevealer__InvalidReveal

```solidity
error CommitRevealer__InvalidReveal();
```

## Structs
### Commitment

```solidity
struct Commitment {
    bytes32 commitment;
    uint256 timePoint;
}
```

