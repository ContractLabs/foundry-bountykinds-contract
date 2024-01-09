# IBinaryPlan
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/interfaces/IBinaryPlan.sol)


## Functions
### initialize


```solidity
function initialize(address root_) external;
```

### getTree


```solidity
function getTree(address root) external view returns (address[] memory tree);
```

### addReferrer


```solidity
function addReferrer(
    address referrer,
    address referree,
    bool isLeft
)
    external;
```

### updateVolume


```solidity
function updateVolume(address account, uint96 volume) external;
```

### withdrawableAmt


```solidity
function withdrawableAmt(address account_) external view returns (uint256);
```

### updateClaimableAmt


```solidity
function updateClaimableAmt(address account_, uint256 claimed_) external;
```

## Structs
### Account

```solidity
struct Account {
    address directReferrer;
    uint96 leftVolume;
    uint8 leftHeight;
    uint96 directBonus;
    uint8 rightHeight;
    uint96 rightVolume;
    uint96 maxVolume;
    uint96 claimed;
}
```

### Bonus

```solidity
struct Bonus {
    uint16 directRate;
    uint16 branchRate;
}
```

