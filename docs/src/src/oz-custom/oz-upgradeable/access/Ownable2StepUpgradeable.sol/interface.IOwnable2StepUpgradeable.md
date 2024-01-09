# IOwnable2StepUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/access/Ownable2StepUpgradeable.sol)


## Functions
### pendingOwner


```solidity
function pendingOwner() external view returns (address _pendingOwner);
```

### acceptOwnership


```solidity
function acceptOwnership() external;
```

## Events
### OwnershipTransferStarted

```solidity
event OwnershipTransferStarted(
    address indexed previousOwner, address indexed newOwner
);
```

## Errors
### Ownable2Step__CallerIsNotTheNewOwner

```solidity
error Ownable2Step__CallerIsNotTheNewOwner();
```

