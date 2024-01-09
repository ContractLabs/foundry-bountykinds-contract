# BitMapsUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/utils/structs/BitMapsUpgradeable.sol)

*Library for managing uint256 to bool mapping in a compact and efficient
way, providing the keys are sequential.
Largelly inspired by Uniswap's
https://github.com/Uniswap/merkle-distributor/blob/master/contracts/MerkleDistributor.sol[merkle-distributor].*


## Functions
### get

*Returns whether the bit at `index` is set.*


```solidity
function get(
    BitMap storage bitmap,
    uint256 index
)
    internal
    view
    returns (bool isSet);
```

### setTo

*Sets the bit at `index` to the boolean `value`.*


```solidity
function setTo(BitMap storage bitmap, uint256 index, bool shouldSet) internal;
```

### set

*Sets the bit at `index`.*


```solidity
function set(BitMap storage bitmap, uint256 index) internal;
```

### unset

*Unsets the bit at `index`.*


```solidity
function unset(BitMap storage bitmap, uint256 index) internal;
```

## Structs
### BitMap

```solidity
struct BitMap {
    mapping(uint256 => uint256) _data;
}
```

