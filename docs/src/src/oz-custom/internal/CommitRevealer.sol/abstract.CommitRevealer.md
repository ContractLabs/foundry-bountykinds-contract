# CommitRevealer
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/internal/CommitRevealer.sol)

**Inherits:**
[ICommitRevealer](/src/oz-custom/internal/interfaces/ICommitRevealer.sol/interface.ICommitRevealer.md)


## State Variables
### commitments

```solidity
mapping(address => Commitment) public commitments;
```


## Functions
### _commit


```solidity
function _commit(
    address account_,
    bytes32 commitment_,
    bytes calldata extraData_
)
    internal
    virtual;
```

### _checkReveal


```solidity
function _checkReveal(
    address account_,
    bytes memory revealBytes_
)
    internal
    virtual;
```

