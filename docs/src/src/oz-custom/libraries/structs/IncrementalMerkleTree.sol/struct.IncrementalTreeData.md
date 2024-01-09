# IncrementalTreeData
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/structs/IncrementalMerkleTree.sol)


```solidity
struct IncrementalTreeData {
    uint256 depth;
    uint256 root;
    uint256 numberOfLeaves;
    BitMaps.BitMap knownRoots;
    mapping(uint8 => uint256) zeroes;
    mapping(uint32 => uint256) leaves;
    mapping(uint256 => uint256[2]) lastSubtrees;
}
```

